# Ruby Capstone 

> This is the Capstone Project from the Microverse Program which intends to apply our knowledge of Ruby in a real-world-like project, built with business specifications
> This particular project focuses on applying linters to a CSS file ('/code.css') and has 4 basic rules:
- Checks indentation
- Checks the presence of more than one empty lines
- Checks the presence of whitespace before '{' and ';' 
- Checks the presence of whitespace after ',' and ':' 

![Screenshot](screenshot.png)

## Built With

- Ruby
- Rspec 3.9

## Video Presentation

[Video Presentation Link](https://www.loom.com/share/7934d967438b44379f6bedbf0e64f66e)

### Prerequisites

- Browser (Google Chrome, Mozilla Firefox, Safari or any other browser)

### Getting Started
```
Open Terminal
run git clone git@github.com:abouhid/Ruby-Capstone.git
run gem install colorize (in case you do not have it installed)
run cd Ruby-Capstone
run ruby bin/main.rb
```

### To Run Tests
In case you want to test the code, it is quite simple for it to be done:
```
Open root directory
run rspec
```

## Rules 

* These are the examples extracted from the '/code.css' file that the code analyzes, here we can see both bad and good practices in CSS:

**Checking Indentation**

bad code:
```
div { 
    font-size: 12pt;
color: red; 
  bottom: 12px;
}
```
good code:
```
div { 
  font-size: 12pt;
  color: red; 
  bottom: 12px;
}
```

**Checking More than one empty line**

bad code:
```
img{
    width: 20px; 
}


h1, h2 {
    margin-top: 0;
}
```
good code:
```
img{
  width: 20px; 
}

h1, h2 {
  margin-top: 0;
}
```
**Checking Spacing before/after specific elements**

bad code:
```
p,h3{
    font-family : Arial,sans-serif ;
}

a{
font-size:large ;
font-weight:   100;
}
```
good code:
```
p, h3 {
  font-family: Arial, sans-serif;
}

a {
  font-size: large;
  font-weight: 100;
}
```

## Author

👤 **Alexandre Bouhid**

- Github: [@abouhid](https://github.com/abouhid)
- LinkedIn: [Alexandre Bouhid](https://www.linkedin.com/in/alexandrebouhid/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page]().

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- GitHub
- TheOdinProject
- Ruby

## 📝 License

This project is [MIT](lic.url) licensed.
