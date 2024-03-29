<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../layout/taglib.jsp" %>

<%-- <h1>${user.name}</h1> --%>

<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  New Blogs
</button>


<!-- Modal -->
<form:form commandName="blog" cssClass="form-horizontal blogForm" >
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">New Blogs</h4>
      </div>
      <div class="modal-body">
       
       <div class="form-group">
			<label for="name" class="col-sm-2 control-label">Name :</label>
				<div class="col-sm-10">
				    <form:input path="name" cssClass="form-control"/>
				    <form:errors path="name" />
				</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">URL :</label>
				<div class="col-sm-10">
				    <form:input path="url" cssClass="form-control"/>
				    <form:errors path="url" />
				</div>
		</div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit"  class="btn btn-primary" value="Save" />
      </div>
    </div>
  </div>
</div>
</form:form>

<script type="text/javascript">
 $(document).ready(function(){
	 $('.nav-tabs a:first').tab('show'); // Select first tab
	 $(".triggerRemove").click(function(e){
		 e.preventDefault();
		 $("#modalRemove .removeBtn").attr("href" , $(this).attr("href"));
		 $("#modalRemove").modal();
	 });
	 $(".blogForm").validate(
				{
					rules:{
						name:{
							required :true,
							minlength:3
						},
						url:{
							required :true,
							url :true
						}
					},	

				highlight:function(element){
					$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
					},
				unhighlight:function(element){
					$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
				}
		});
 });
</script>

<!-- Nav tabs -->
<br><br>
<ul class="nav nav-tabs" role="tablist">
	<c:forEach items="${user.blogs}" var="blog">
 		 <li><a href="#blog_${blog.id}" role="tab" data-toggle="tab">${blog.name}</a></li>
	</c:forEach>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<c:forEach items="${user.blogs}" var="blog">
	
  		<div class="tab-pane" id="blog_${blog.id}">
  		
  		<h1>${blog.name}</h1>
	<p>
	<a href="<spring:url value="/blog/remove/${blog.id}.htm" />" class="btn btn-danger triggerRemove">Remove blog</a>
	${blog.url}
	</p>
	
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${blog.items }" var="item">
				<tr>
					<td>${item.title}</td>
					<td>${item.link}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
  	 
  		</div>
  </c:forEach>
</div>

<!-- Modal confirm deleted-->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove Blog</h4>
      </div>
      <div class="modal-body">
            Really remove ?
      </div>
      <div class="modal-footer">
		<a href="" class="btn btn-danger removeBtn">Remove</a>
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
