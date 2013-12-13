<%--

  Contextual Footer component.

--%><%
%><%@include file="/libs/foundation/global.jsp"%>
<%@page import="com.day.cq.wcm.api.Page, javax.jcr.NodeIterator, java.util.Iterator" %>
<footer>
    <nav>
        <% 
        // Get the parent page using the currentPage (Page) object provided by CQ.
        Page parent = currentPage.getParent();
        
        if (parent != null) {
        
            // Create an Iterator. listChildren() method returns an Iterator<Page>
            Iterator<Page> children = parent.listChildren();
            
            // While the iterator list has a next child
            while (children.hasNext()){
                
                // Get the child page. The next() method returns the next object in the collection.
                Page child = children.next();
                
                // Check that we are not including the current page. Using the equals() method inherited from the java Object class 
                if (currentPage.equals(child)) { continue; }
                
                // "Print" a DIV tag to the html
                %><div><%
                
                // Logic to get the Title. check title first, then page title and lastly name.
                if (child.getTitle() != null){
                    
                    // Print the title to the html
                    %><%=child.getTitle()%><%
                } else if (child.getPageTitle() != null) {
                    
                    // Print the page title to the html
                    %><%=child.getPageTitle()%><%
                } else {
                    
                    // Last option: print the name to the html
                    %><%=child.getName()%><%
                }
                
                // Print the closing div for each child
                %> </div> <%
            }
        }
        %>
    </nav>
    <%=currentStyle.get("disclaimer", "Edit Disclaimer in Design")%>
</footer>