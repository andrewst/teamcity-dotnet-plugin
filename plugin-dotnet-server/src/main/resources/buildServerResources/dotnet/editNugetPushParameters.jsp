<%@ taglib prefix="forms" tagdir="/WEB-INF/tags/forms" %>
<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="propertiesBean" scope="request" type="jetbrains.buildServer.controllers.BasePropertiesBean"/>
<jsp:useBean id="params" class="jetbrains.buildServer.dotnet.DotnetParametersProvider"/>

<script type="text/javascript">
    BS.DotnetParametersForm.paths["nuget push"] = "Packages";
</script>

<tr>
    <th class="noBorder"><label for="${params.nugetPushApiKey}">API key: <l:star/></label></th>
    <td>
        <div class="posRel">
            <props:passwordProperty name="${params.nugetPushApiKey}" className="longField"/>
        </div>
        <span class="error" id="error_${params.nugetPushApiKey}"></span>
        <span class="smallNote">Specify the API key to access a NuGet packages feed.<br/>
            For built-in TeamCity NuGet server use <em>%teamcity.nuget.feed.api.key%</em>.</span>
    </td>
</tr>

<tr>
    <th><label for="${params.nugetPushSourceKey}">Source: <l:star/></label></th>
    <td>
        <div class="posRel">
            <props:textProperty name="${params.nugetPushSourceKey}" className="longField"/>
        </div>
        <span class="error" id="error_${params.nugetPushSourceKey}"></span>
        <span class="smallNote">Specify the server URL. For built-in TeamCity NuGet server use <em>%teamcity.nuget.feed.server%</em>.</span>
    </td>
</tr>

<tr class="advancedSetting">
    <th>Options:</th>
    <td>
        <props:checkboxProperty name="${params.nugetPushNoSymbolsKey}"/>
        <label for="${params.nugetPushNoSymbolsKey}">Do not publish existing nuget symbols package</label><br/>
        <props:checkboxProperty name="${params.nugetPushNoBufferKey}"/>
        <label for="${params.nugetPushNoBufferKey}">Disable buffering when pushing to server to decrease memory
            usage</label>
    </td>
</tr>