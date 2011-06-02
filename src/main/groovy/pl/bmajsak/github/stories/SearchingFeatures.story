package pl.bmajsak.github.stories

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.support.PageFactory

import pl.bmajsak.github.pages.*

description "Verify project's page on GitHub."

before "Start WebDriver", {
    projectName = "webdriver-easyb"
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
    
    given "User enters project page"
    
    when "Hit keyboard shortcut to enable quick finder"
    
    and "types README"
    
    then "File should be listed in tree viewer"
    
}

after "", {
    driver.quit();   
}
