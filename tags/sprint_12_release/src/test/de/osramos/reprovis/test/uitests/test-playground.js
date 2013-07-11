// Leaflet workd map testings
describe("Leaflet world map", function() {
	it("should initialize the map object", function() {
		expect(typeof map).toBe("object");
	});
	
	it("should have an API key", function() {
		expect(pluginConf.apikey).not.toBeFalsy();
	});
	
	it("should have a style", function() {
		expect(pluginConf.style).not.toBeFalsy();
	});
	
	it("should have center", function() {
		expect(pluginConf.center).not.toBeFalsy();
	});
	
	it("should have maxzoom", function() {
		expect(pluginConf.maxZoom).not.toBeFalsy();
	}); 
	
	it("should have startHeight", function() {
		expect(pluginConf.startHeight).not.toBeFalsy();
	});
});

// Testings for global hierarchy handler
describe("Global Hierarchy Handler", function() {
	it("should create the object", function() {
		expect(GlobalHierarchyHandler).not.toBeFalsy();
	});
	
	it("should zoom into global level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("global", 0);
		});
	});
	
	it("should zoom into factory level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("factory", 1);
		});
	});
	
	it("should zoom into hall level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("hall", 1);
		});
	});
	
	it("should zoom into line level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("line", 1);
		});
	});
	
	it("should zoom into location level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("location", 1);
		});
	});
	
	it("should zoom into testingDevice level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("testingDevice", 1);
		});
	});
	
	it("should zoom into component level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("component", 1);
		});
	});
});

describe("Navigation hierarchy", function() {
	it("should create the object", function() {
		expect(typeof GlobalHierarchyHandler.Navigation).toBe("object");
	});
	
	it("should compose navigation elements", function() {
		expect(typeof GlobalHierarchyHandler.Navigation.composeNavElements()).toBe("object");
	});
	
	it("should create breadcrumb", function() {
		expect(GlobalHierarchyHandler.Navigation.createBreadcrumb()).not.toBeFalsy();
	});
});

describe("Testing Device", function() {
	it("should create the Testing Device object", function() {
		expect(typeof TestingDevice).toBe("object");
		
	});
	
	it("should perform the AJAX data call without error", function() {
		TestingDevice.getData(1, function(a, data) {
			expect(data.parent).not.toBeFalsy();
		});
	});
	
	it("should have a status", function() {
		TestingDevice.getData(1, function(a, data) {
			expect(data.status).not.toBeFalsy();
		});
	});
});

describe("Factory", function() {
	it("should create the Factory object", function() {
		expect(typeof Factory).toBe("object");
		
	});
	
	it("should perform the AJAX data call without error", function() {
		Factory.getData(1, function(a, data) {
			expect(data.parent).not.toBeFalsy();
		});
	});
	
	it("should have a status", function() {
		Factory.getData(1, function(a, data) {
			expect(data.status).not.toBeFalsy();
		});
	});
});

describe("Hall", function() {
	it("should create the Hall object", function() {
		expect(typeof Hall).toBe("object");
		
	});
	
	it("should perform the AJAX data call without error", function() {
		Hall.getData(1, function(a, data) {
			expect(data.parent).not.toBeFalsy();
		});
	});
	
	it("should have a status", function() {
		Hall.getData(1, function(a, data) {
			expect(data.status).not.toBeFalsy();
		});
	});
});

describe("Line", function() {
	it("should create the Line object", function() {
		expect(typeof Line).toBe("object");
		
	});
	
	it("should perform the AJAX data call without error", function() {
		Line.getData(1, function(a, data) {
			expect(data.parent).not.toBeFalsy();
		});
	});
	
	it("should have a status", function() {
		Line.getData(1, function(a, data) {
			expect(data.status).not.toBeFalsy();
		});
	});
});

describe("Location", function() {
	it("should create the Location object", function() {
		expect(typeof Location).toBe("object");
		
	});
	
	it("should perform the AJAX data call without error", function() {
		Location.getData(1, function(a, data) {
			expect(data.parent).not.toBeFalsy();
		});
	});
	
	it("should have a status", function() {
		Location.getData(1, function(a, data) {
			expect(data.status).not.toBeFalsy();
		});
	});
});