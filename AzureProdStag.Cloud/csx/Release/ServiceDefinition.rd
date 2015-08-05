<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureProdStag.Cloud" generation="1" functional="0" release="0" Id="a5027e33-ca9b-46e1-9883-b3dc4203e885" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureProdStag.CloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AzureProdStag.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/LB:AzureProdStag.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AzureProdStag.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/MapAzureProdStag.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AzureProdStag.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/AzureProdStag.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAzureProdStag.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/AzureProdStag.WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureProdStag.Web" generation="1" functional="0" release="0" software="E:\R&amp;D\AzureProdStag\AzureProdStag.Cloud\csx\Release\roles\AzureProdStag.Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureProdStag.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureProdStag.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/AzureProdStag.WebInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/AzureProdStag.WebUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/AzureProdStag.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="AzureProdStag.WebUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="AzureProdStag.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureProdStag.WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="56dad1dc-9cc5-40e7-be6c-6a42cbbfd4fc" ref="Microsoft.RedDog.Contract\ServiceContract\AzureProdStag.CloudContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="bd8e5056-6327-408c-871a-85ef0c8b59eb" ref="Microsoft.RedDog.Contract\Interface\AzureProdStag.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureProdStag.Cloud/AzureProdStag.CloudGroup/AzureProdStag.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>