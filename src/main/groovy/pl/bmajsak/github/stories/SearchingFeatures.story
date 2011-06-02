package pl.bmajsak.github.stories

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.support.PageFactory

import pl.bmajsak.github.pages.*

description "Demonstrating various searching capabilities of github"

before "Start browser and setup shared fixture", {
    projectName = "webdriver-easyb"
    fullProjectName = "bartoszmajsak/" + projectName
    driver = new FirefoxDriver();
}

scenario "Searching for project ${projectName} by it's name", {
    
    given "User is on the main page", {
        mainPage = PageFactory.initElements(driver, MainPage.class)
    }
    
    when "Enters project's name ${projectName} ", {
        resultsPage = mainPage.searchForProject(projectName)
    }
    
    then "Link to project site should be listed", {
        resultsPage.containsProject projectName
    }
    
}

scenario "Search for a file using tree finder", {
    
    fileName = "pom.xml"
    
    given "User enters project page", {
        projectPage = new ProjectPage(driver, fullProjectName) 
        
    }
    
    when "Hits keyboard shortcut to enable quick finder", {
        treeFinder = projectPage.enableTreeFinder()
    }
    
    and "searches for ${fileName}", {
        treeFinder.type(fileName)
    }
    
    then "File should be listed in tree viewer", {
        treeFinder.contains(fileName)
    }
    
}

after "Close browser", {
    driver.quit();   
}
