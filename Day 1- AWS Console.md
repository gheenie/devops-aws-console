# Using the AWS Console

### Prerequisite: 
Launch a WhizLabs sandbox and use the credentials to log in to the console.

## Task

The aims of this execise are:
1. To get familiar with the AWS console and how to access resources, especially EC2.
1. To be confident in accessing a remote resource and deploying a simple application.

Your task is to set up a basic Express server on AWS EC2.  To start with, we don't need anything complicated. We can just use the simple `Hello World` example from the [Express documentation](https://expressjs.com/en/starter/hello-world.html) - something like this...
```node
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello Northcoders!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
```

Remember that the EC2 instance will have very little pre-installed software - just a bare Linux operating system. It will not, for example have Node installed. You will have to SSH onto the box and install your server code there, install any dependencies you need and start the server. 

Some guidelines:
 - Use a `t2.micro` instance (the default).
 - You should probably stick to an Amazon Linux operating system, although another Linux OS would do in principle. However, if you choose a different OS, you're on your own...
 - Make sure you create a key pair and save it, otherwise you won't be able to access the instance.
 - Make sure you allow HTTP and SSH traffic. If you want to be security conscious, restrict access to your own IP address. (You can edit these settings in the "Security Groups" section if you need to.)
 - Make sure you have enabled public IP address creation.
 - You may need to use a text editor to edit files while working on the server. There are built-in command-line editors called `vi`, `vim` and `nano`. `vi` and `vim` are a bit tricky - basically they are relics of the 1970s and 80s, so of course I love them :grin - but `nano` is probably a bit easier to get used to.
 - Remember that you will have to use `npm` to install the code dependencies.
 - The code above listens on Port 3000. Incoming HTTP requests arrive at Port 80. You will need to redirect the request from Port 80 to Port 3000 to allow the server to respond. This sort of thing is normally accomplished by a Web server or "reverse proxy" application like Apache or Nginx. For our basic purposes, we can use a slightly hacky solution that uses the built-in `iptables` bash comand to redirect the traffic:
```bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
```
Obviously, if you have chosen a different port for your app, then replace the `3000` with the correct number.

This should make your server output accessible to outside traffic. You can use your browser or the [curl](https://linuxize.com/post/curl-command-examples/) command from your terminal. The public IP address will be in the details of the instance. It will just be a bunch of numbers because we haven't registered a nice domain name to go with it.

Happy server creation!

## Extension Task
How about deploying an Express server you have already created in the backend section of the course? How are you going to get the code from your repo onto the EC2 machine? What additional steps do you need to take?
