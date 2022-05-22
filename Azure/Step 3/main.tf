resource "azurerm_resource_group" "cox_app_RG" {
  name     = "191-78597593-deploy-a-web-application-with-terrafo"
  location = "Central US"
}

resource "azurerm_app_service_plan" "coxsvcplan" {
  name                = "cox-appserviceplan"
  location            = "centralus"
  resource_group_name = "191-78597593-deploy-a-web-application-with-terrafo"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "coxappsvc" {
  name                = "cox-app-service"
  location            = "centralus"
  resource_group_name = "191-78597593-deploy-a-web-application-with-terrafo"
  app_service_plan_id = azurerm_app_service_plan.coxsvcplan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

}