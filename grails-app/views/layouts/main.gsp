<html>
    <head>
        <title><g:layoutTitle default="YWCA TechGyrls" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div class="ywcaHeader" id="ywcaBanner"><img src="${resource(dir:'images',file:'ywcaheader.png')}" alt="YWCA" /></a></div>
        <div class="nameHeader" style="z-index: 5">
    		<h2>${fieldValue(bean: userInstance, field: "login")}</h2>
    	</div>
        <g:layoutBody />
    </body>
</html>