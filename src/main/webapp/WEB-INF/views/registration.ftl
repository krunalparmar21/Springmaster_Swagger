
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- External  css -->
<link rel="stylesheet" href="./resources/css/registration.css">

<link rel="stylesheet" href="./resources/css/registration_inline.css">

<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap-datepicker.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
	#imgPreview{
		width: 150px;
		height: 200px;
		border: 1px solid black;
	}
	</style>
	
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<body>
	<#if userObject.email??>
		<#assign pageName="update">
	<#else>
		<#assign pageName="SaveUser">
	</#if>		
	<form class="signup-form" id="registerform" action="${pageName}" modelAttribute="registerFormData" method="post"  enctype='multipart/form-data'  >
	
		<!-- form header -->
		<div class="form-header">
			<h1>Register</h1>
		</div>

		<!-- form body -->
		<div class="form-body">
			<input type="hidden" name="id" value="${userObject.id!""}">
							
					
			<!-- Firstname and Lastname -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="first_name" class="label-title">First name *</label> <input
						path="firstname" id="firstname" value="${userObject.firstname!""}" name="firstname" class="form-input"
						placeholder="enter your first name" /> 
						
				</div>
				<div class="form-group right">
					<label for="lastname" class="label-title">Last name</label> <input
						type="text" path="lastname" id="lastname" value="${userObject.lastname!""}" name="lastname" class="form-input"
						placeholder="enter your last name" /> 	
					</div>
			</div>

			<!-- D	ob and Phone no -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="Date" class="label-title"> DOB </label> <input
						type="date" path="dob" id="datepicker" value="${userObject.dob!""}" class="form-input" name="dob"
						placeholder="enter your DOB">
				</div>
				<div class="form-group right">
					<label for="phone no" class="label-title">Phone No</label> <input
						type="number" path="mobileno"  class="form-input" id="phoneno"
						placeholder="enter your phone no" value="${userObject.mobileno!""}" name="mobileno"
						required="required"> 
						
					</div>
			</div>


			<!-- Email -->
			<div class="form-group">
				<label for="email" class="label-title">Email*</label> <input
					type="email" path="email"  id="email" value="${userObject.email!""}" name="email" class="form-input"
					placeholder="enter your email">
			</div>

			<!-- Passwrod and confirm password -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="password" class="label-title">Password *</label> <input
					path="password"	type="password" value="${userObject.password!""}" id="password"  class="password"
					name="password"	placeholder="enter your password" required="required">
				
				</div>
				<div class="form-group right">
					<label for="confirm-password" class="label-title">Confirm
						Password *</label> <input type="password" class="form-input"
						path="passwordConfirm" id="cpassword" value="${userObject.passwordConfirm!""}" name="passwordConfirm"
						placeholder="enter your password again" required="required">
			
				</div>
			</div>
			<!-- Gender and Hobbies -->

			<div class="horizontal-group">
				<div class="form-group left">
					<label class="label-title">Gender:</label>
					<div class="input-group">
						<label for="male"><input type="radio" name="gender"
						path="gender" value="male" id="male1"> Male</label> <label for="female"><input
						path="gender"type="radio" name="gender" value="female" id="female1">
							Female</label>
						<span id="radio_error"></span>	
					</div>
				</div>
				<div class="form-group right">
					<label class="label-title">Hobbies</label>
					<div><select class="form-control"
									id="hobby" name="hobby">
									<option value="not">Select Hobby</option>
									<option value="Cricket">Cricket</option>
									<option value="BasketBall">BasketBall</option>
									<option value="Hockey">Hockey</option>
								</select>
					</div>
				</div>
			</div>

			<!-- Profile picture and Age -->
			<div class="form-group">
				<div id="form-group left">
					<label for="choose-file" class="label-title">Upload Profile Picture</label> 
					<input type="file" path="image" name="image" id="choose-file" >
					<div id="img-view">	
						<#if userObject.email??><img id='imgPreview'  alt='Profile preview' src="data:image/jpg;base64,${userObject.imageBase64!""}" width='100%' height='100%'/></#if>					
					</div>
				</div>	
			</div>

			<!-- Address Address[0][address_line2] -->
			<divs id="main-container">			
				<#list userObject.address![] as address>
				<div class="panel card container-item">
					<input type="hidden" name="AddressId[]" id="AddressId[]" value="${address.Aid!""}">		
					<div class="panel-body">
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label class="control-label" for="address_line_one_0">Address
											line 1</label> <input type="text" 
											class="form-control" name="Address1[]" value="${address.address1!""}" id="address1" maxlength="255">	
										<p class="help-block help-block-error" id="address1error"></p>
									</div>
								</div>
							</div>
								
							<div class="row">
								<div class="col-sm-6">
									<label class="control-label" for="country">City</label> 
									<span>
									        <select class="form-control" id="city${address?index!""}" name="city[]">
     											<option value="not">Select City</option>
													<option value="Pune">pune</option>
													<option value="Ahmedabad">Ahmedabad</option>
													<option value="Surat">Surat</option>
													<option value="Amreli">Amreli</option>
											</select>
											<span id="city_error"></span>
										</span>
								</div>
								<div class="col-sm-6">
									<label class="control-label" for="country">State</label>
									<span>	 
										<select class="form-control" id="state${address?index!""}" 
										name="state[]" >
									      		<option value="not">Select State</option>
													<option value="Gujarat">Gujarat</option>
													<option value="Mumbai">Mumbai</option>
													<option value="MP">MP</option>
													<option value="UP">UP</option>
									  	</select>
									  <span id="state_error"></span>	
							  		</span>	
								</div>
			
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label" for="city_0">Area</label> <input
											type="text" id="city_0" class="form-control"
											name="area[]"  value="${address.area!""}" maxlength="64">
										<p class="help-block help-block-error"></p>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label" for="city_0">Postal code</label>
										<input  type="text" class="form-control"
										name="postalcode[]" value="${address.postalcode!""}" id="postalcode"  maxlength="64">
										<p class="help-block help-block-error" id="postalcode_error"></p>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div>
										<a href="javascript:void(0)"
											class="remove-item btn btn-sm btn-danger remove-social-media">Remove</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
					<script type="text/javascript">
						$("#state${address?index}").val ("${address.state}");
						$("#city${address?index}").val ("${address.city}");
					</script>
				<#else>
					<div class="panel card container-item">
					<div class="panel-body">
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label class="control-label" for="address_line_one_0">Address
											line 1</label> <input type="text" id="address1"
											class="form-control" name="Address1[]" maxlength="255">	
										<p class="help-block help-block-error " id="address1error"></p>
									</div>
								</div>
							</div>
								
							<div class="row">
								<div class="col-sm-6">
									<label class="control-label" for="country">City</label> 
									        <select class="form-control"  id="city" name="city[]">
     											<option value="not">Select City</option>
													<option value="Pune">pune</option>
													<option value="Ahmedabad">Ahmedabad</option>
													<option value="Surat">Surat</option>
													<option value="Amreli">Amreli</option>
											</select>
											  <span id="city_error"></span>	
							  		
								</div>
								<div class="col-sm-6">
									<label class="control-label" for="country">State</label> 
								<select class="form-control" name="state[]" id="state" >
							      		<option value="not">Select State</option>
											<option value="Gujarat">Gujarat</option>
											<option value="Mumbai">Mumbai</option>
											<option value="MP">MP</option>
											<option value="UP">UP</option>
							  	</select>	
							  	  <span id="state_error"></span>	
							  		
								</div>
			
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label" for="city_0">Area</label> <input
											type="text" id="city_0" class="form-control"
											name="area[]" maxlength="64">
										<p class="help-block help-block-error"></p>
									</div>
								</div>
								<div class="col-sm-6">
										<label class="control-label" for="city_0">Postal code</label>
									<div class="form-group">
										<input type="number" id="postalcode" class="form-control"
											name="postalcode[]" maxlength="64" >
										<p class="help-block help-block-error" id="postalcode_error"></p>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div>
										<a href="javascript:void(0)"
											class="remove-item btn btn-sm btn-danger remove-social-media">Remove</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</#list>	
			</div>
			<div class="card">
				<div>
					<a class="btn btn-success btn-sm" id="add-more" href="javascript:;"
						role="button"><i class="fa fa-plus"></i> Add more address</a>
				</div>
			</div>

			<!-- form-footer -->
			<div class="form-footer">
				<span>* required</span>
				<button type="submit" id="Rbtn" class="btn">Create</button>
			</div>
			
	</form>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-149371669-1"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			<#if userObject.email??>
				$("input[name=gender][value=${userObject.gender}]").prop("checked",true);	
				$("#hobby").val ("${userObject.hobby!""}"); 
			</#if>
		
	 });
		$('#choose-file').change(function(){
	        const file = this.files[0];
	        if (file){
	          let reader = new FileReader();
	          reader.onload = function(event){
	        	$("#img-view").html($("<img id='imgPreview'  alt='Profile preview' width='100%' height='100%'/>"));
	            $('#imgPreview').attr('src', event.target.result);
	          }
	          reader.readAsDataURL(file);
	        }
	 });

	</script>		
	
	<script
		src="./resources/js/validation.js"></script>
	
	<script
		src="./resources/js/jquery.min.js"></script>
	<script
		src="./resources/js/popper.min.js"></script>
	<script
		src="./resources/js/bootstrap.min.js"></script>
	<script
		src="./resources/js/bootstrap-datepicker.js"></script>
	<script
		src="./resources/js/select2.js"></script>
	<script
		src="./resources/js/bootstrap-select.js"></script>
	<script src="./resources/js/ckeditor.js"></script>
	<script src="./resources/js/cloneData.js"></script>
	<script src="./resources/js/clone2.js" ></script>
	
	</body>
</html>