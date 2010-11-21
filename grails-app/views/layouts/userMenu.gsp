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
    		<h2 style="background-image:url(/techgyrls/images/backgrounds/name_bkgd.png)">${fieldValue(bean: bioInstance, field: "firstName")} ${fieldValue(bean: bioInstance, field: "lastName")}</h2>
    	</div>
        <div class="tabBar">
        	<div class="biotab" style="z-index:5"><a href="../portfolio/${fieldValue(bean: userInstance, field: "id")}"><img src="/techgyrls/images/buttons/bio.png"/></a></div>
        	<div class="careerstab" style="z-index:4"><a href="../careers/${fieldValue(bean: userInstance, field: "id")}"><img src="/techgyrls/images/buttons/careers.png"/></a></div>
        	<div class="educationtab" style="z-index:3"><a href="../education/${fieldValue(bean: userInstance, field: "id")}"><img src="/techgyrls/images/buttons/education.png"/></a></div>
        	<div class="projectstab" style="z-index:2"><a href="../projects/${fieldValue(bean: userInstance, field: "id")}"><img src="/techgyrls/images/buttons/projects.png"/></a></div>
		</div>
        <g:layoutBody />
        <div class="photoBkgd" style="z-index: -5"></div>
    </body>
</html>