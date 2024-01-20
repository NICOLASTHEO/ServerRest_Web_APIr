# AUTOMATION-CHALLENGE - SOME COMPANY

This is an automation project  for the **AUTOMATION-CHALLENGE from SOMECOMPANY** it's with [Robot Framework](https://robotframework.org/), aims to implement the project pattern to Page Objects and test cases written with [Gherkin](https://cucumber.io/docs/gherkin/reference/) and [Procedural], at the beginning of each test there is a information in the Documentation about the methodology to be used.

Robot's libraries encapsulate the most used testing tools on the market. Main libraries, to run the GUI tests on Web systems, the selenium library is been used [Selenium](https://www.selenium.dev/); To run GUI tests for API tests, the library of [Python requests](https://github.com/kennethreitz/requests), which provides all the necessary tools for HTTP requests, both for REST and SOAP.

## This automations is associated to ##
In jira its associated to the https://github.com/SOMECOMPANY/automation-challenge, on Github, https://github.com/.

## Project Configuration

Robot framework is built with Python, so it is necessary that you have the latest version of this technology installed on your machine and it can be found through the [Python official page](https://www.python.org/downloads/), and [Robot Framework page] (https://robotframework.org/).

The installation of the framework and its auxiliary libraries is done through `pip`, Python's native library manager. Proceed with the command below:

```sh
$ pip install robotframework
```

And check if the installation went correctly:

```sh
$ robot --version
```

Next, install the libraries that will be used in the project using the `pip` command:
for example:
- [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary/)
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests#readme)

# Before you run #

## Web Test Setup ##
The tests may be run in two different modes:

## Running in local ##

In the machine, if you would like to see how all WEB tests are going on, let it with "Chrome Headless", as that the browser will show up and you can follow and all steps on screen.


## Running in CI ##

Always remember to set browser = Headless, this is the fastest way to run tests and just like that we can make the tests running in the CI/CD environment.

On this repository tests for API are integrated to CI environment on Gitlab: INFORM THE LINK

# How to copy this project into yours #
Clone to your computer throght Git, the files and scripts on https://github.com/NICOLASTHEO/ServerRest_Web_APIr.

# Documentation #

## Default Steps Definitions ##
About WEB Testing, The Suite tests the Login Page of SERVEREST: https://front.serverest.dev/login, once a valid Email is already registered.
As Context requirments, we should think, As a registered User, I want login into my Home page, For that I can shopping.

To run this test by comand line:   robot -d results -i Login tests/serverest_tests.robot

About API, The Suite tests the Login Page of SERVEREST: https://serverest.dev. Creating a fast and dinamic CRUD suite.

To run this test by comand line: robot -d results tests/api_users.robot

## Custom Steps Definitions - How to make your own steps ##
A test can't depend on each other.

For web testing: As a registered User, I want login into my Home page, For that I can shopping.

# Project Execution #
## How to run ##

To execute the scripts, execute the command below via terminal being inside the project's root directory, on folder AUTOMATION-CHALLENGE and passing as arguments the directory where the reports and execution logs will be inserted (results) and the directory where the test scripts are, for web testing (web_testing/tests...), and for APR testing (api_testing/tests...), as bellow:

Web-testing:
```sh
robot -d results -i Login web_testing/tests/serverest_tests.robot
```
API-testing:
```sh
robot -d results api_testing/tests/api_users.robot
```

# execution parameters #

## -browser (default: -browser=chrome ) ##
chrome, firefox, edge

## config (default: -config=support/config ) ##
Config directory path

# Design standards and best practices #
To work on a Robot Framework project it is strongly recommended that the programmer constantly read its [documentation](https://robotframework.org/robotframework/#user-guide),  and be aware of the [Python design standards](https://python-patterns.guide/),  technology used to implement the framework.

The purpose of this approach is to build simple and readable scripts. For those who don't know the project easily understand it.

## Libraries used in the Project

In this project we are using the libraries below:
EXAMPLES:

## [seleniumlibrary]: ##
pip install robotframework-seleniumlibrary

## [Requests]: ##
pip install robotframework-requests

# Any questions, can me 👻 : #
- Theo Nicolas Gomes de Araujo
## or by LinkedIn: ##
- https://www.linkedin.com/in/theo-araujo-45553246/