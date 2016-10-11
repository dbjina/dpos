<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="signInModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel">Sign In</h4>
      </div>
      <form class="form-horizontal" action="${ rootPath }/Sign/SignIn.do" method="post" name="signInModalForm" id="signInModalForm">
      <div class="modal-body">
		  <div class="form-group">
		    <label for="emp_id" class="col-sm-2 control-label">ID</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="emp_id" name="emp_id" placeholder="4 digts for your ID" required="required">
		    </div>
		    <div class="col-sm-2">
		      <span id="emp_id_message"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="emp_password" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-8">
		      <input type="password" class="form-control" id="emp_password" name="emp_password" placeholder="Password" required="required">
		    </div>
		    <div class="col-sm-2">
		      <span id="emp_password_message"></span>
		    </div>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Sign in"/>
      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	function checkEmail() {
		var email = document.getElementById("emp_email");
		$.ajax({
			  method: "POST",
			  url: "Sign/CheckValidSignUp.do",
			  data: { "emp_email": email.value },
			  success: function(result) {
				  $("#emp_email_message").html(result["emp_email_message"]);
				  $("#message").html(result["message"]);
			  },
			  dataType: "json"
			})
	}
</script>