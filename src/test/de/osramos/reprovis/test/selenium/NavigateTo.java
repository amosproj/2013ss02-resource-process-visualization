package de.osramos.reprovis.test.selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class NavigateTo {

	private static String baseUrl = "http://localhost:8080/ResourceProcessVisualization/";
	
	public static void config(WebDriver driver){
		driver.get(baseUrl + "config");
	}
	
	private static synchronized void waitForAjaxLoad() throws Exception{
		// the ajax part has half a second time to load
		NavigateTo.class.wait(500);
	}
	
	public static void global(WebDriver driver){
		driver.get(baseUrl);
	}
	
	public static synchronized void factory(WebDriver driver) throws Exception{
		global(driver);
		driver.findElement(By.className("leaflet-clickable")).click();
		driver.findElement(By.className("factoryBtn")).click();
		waitForAjaxLoad();
	}
	
	public static void hall(WebDriver driver) throws Exception{
		factory(driver);
		driver.findElement(By.id("polygon249")).click();
		waitForAjaxLoad();
	}
	
	public static void line(WebDriver driver) throws Exception{
		hall(driver);
		driver.findElement(By.id("rect217")).click();
		waitForAjaxLoad();
	}
	
	public static void location(WebDriver driver) throws Exception{
		line(driver);
		driver.findElement(By.id("testList")).findElement(By.tagName("tbody")).findElement(By.tagName("tr")).click();
		waitForAjaxLoad();
	}
	
	public static void device(WebDriver driver) throws Exception{
		location(driver);
		driver.findElement(By.id("devicelist")).findElement(By.tagName("tbody")).findElement(By.tagName("tr")).click();
		waitForAjaxLoad();
	}
	
	public static void component(WebDriver driver) throws Exception{
		device(driver);
		driver.findElement(By.id("componentlist")).findElement(By.tagName("tbody")).findElement(By.tagName("tr")).click();
		waitForAjaxLoad();
	}
}
