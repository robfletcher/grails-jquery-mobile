<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="mobile">
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		</div>
		<div data-role="content">
			<g:if test="\${flash.message}">
			<div class="message">\${flash.message}</div>
			</g:if>
			<dl>
			<%  excludedProps = Event.allEvents.toList() << 'version'
				allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.each { p -> %>
				<dt><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
				<%  if (p.isEnum()) { %>
					<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
				<%  } else if (p.oneToMany || p.manyToMany) { %>
					<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
						<dd><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></dd>
					</g:each>
				<%  } else if (p.manyToOne || p.oneToOne) { %>
					<dd><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></dd>
				<%  } else if (p.type == Boolean || p.type == boolean) { %>
					<dd><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></dd>
				<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
					<dd><g:formatDate date="\${${propertyName}?.${p.name}}" /></dd>
				<%  } else if(!p.type.isArray()) { %>
					<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
				<%  } %>
			<%  } %>
			</dl>
			<div data-role="controlgroup" data-type="horizontal">
				<g:form>
					<g:hiddenField name="id" value="\${${propertyName}?.id}" />
					<g:actionSubmit data-icon="gear" action="edit" value="\${message(code: 'default.button.edit.label', default: 'Edit')}" />
					<g:actionSubmit data-icon="delete" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" />
				</g:form>
			</div>
		</div>
		<div data-role="footer">
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link data-icon="plus" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
    </body>
</html>
