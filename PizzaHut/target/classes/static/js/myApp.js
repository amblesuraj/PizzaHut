$(document).ready(function()
{

$("#home").addClass("active");


$("li").click(function(){
    $("#home").removeClass("active");
        $("li").removeClass("active");
        $(this).addClass("active");
});


//     mouse click event 
 $(".login-eye").click(function()
 {
       $(".login-eye").toggleClass(" fa fa-eye-slash fa fa-eye");
     
       var x = document.getElementById("password");
     if (x.type === "password") {
       x.type = "text";
     } else {
       x.type = "password";
     }
 });
 


 $(".register-eye").click(function()
 {
       $(".register-eye").toggleClass(" fa fa-eye-slash fa fa-eye");
     
       var x = document.getElementById("cPassword");
       var y = document.getElementById("rPassword");
       if (x.type === "password" &&  y.type==="password") {
         x.type = "text";
         y.type="text";
     } else {
       x.type = "password";
       y.type = "password";
     }
 });

  $( "#loginForm" ).validate({
	 rules:{
		 username: {
			 required:true,
			 minlength:3
		 },
		 password:{
			 required:true,
			 minlength:3
		 }
		 
	 },
	 messages:{
		 
		 username: {
			 required:"Please enter your username",
			 minlength:"username should be consist of at least 3 characters"
		 },
	 	password: {
	 		required:"Please enter the password",
	 	
	 	minlength:"password must be at least 3 characters long"
	 	
	 }
	 },

     tooltip_options:{
         
             username: {
                 trigger:'focus',
                 placement:'top'
             },
            
             password:
             {
                 trigger:'focus',
                 placement:'top'
             }

     },
     submitHandler: function(form)
     {
        form.valid();
     }
     ,
	errorElement: "em",
           errorPlacement: function ( error, element ) {
               // Add the `help-block` class to the error element
               error.addClass( "help-block" ).addClass("text-danger").css("font-size","14px");
   
               // Add `has-feedback` class to the parent div.form-group
               // in order to add icons to inputs
               element.parents( ".form-group" ).addClass( "has-feedback" );
   
               if ( element.prop( "type" ) === "checkbox" ) {
                   error.insertAfter( element.parent( "label" ) );
               } else {
                   error.insertAfter( element );
               }
            }
	} );

 
  
  $("#RegisterForm").validate({
	 
	  rules:{
		  fname:"required",
		  lname:"required",
		  username:{
			  required:true,
			  minlength:3,
			  remote:{
				  url:"/dashboard/checkUsernameAvail",
				  type:"POST",
				  data:{
					  		username:function()
					  		{
					  			return $("#username_check").val();
					  		}
				  }
			  }
		  },
		  email:{
			  required:true,
			  email:true,
			  remote:{
				  url:"/dashboard/checkEmailAvail",
				  type:"POST",
				  data:{
					  		email:function()
					  		{
					  			return $("#email_check").val();
					  		}
				  }
			  }
		  },
		  password:{
			  required:true,
			  minlength:3
		  },
		  confirmPassword:{
			  required:true,
			  equalTo:"#rPassword"      //id of above password
		  }
	  },
	  messages:{
		  fname:"First name is required",
		  lname:"Last name is required",
		  username:{
			  required:"Username is required",
			  minlength:"Username must be 3 charcters long",
			  remote:$.validator.format("Username &quot; {0} &quot; is already exists.")
		  },
		  email:{
			  required:"Email is required",
			  email:true,
			  remote: $.validator.format("Email &quot; {0} &quot; is already exists. Please <a href='/dashboard/login'>sign in</a> ")  //write controller for both the functions
		  },
		  password:{
			  required:"Password is required",
			  minlength:"Password must be 3 charcters long"
		  },
		  confirmPassword:{
			  required:"Confirm Password is required",
			  equalTo:"Confirm password must be same as the password"      //id of above password
		  }
	  },
	  
	  //This is optional ... placement is top by default  
	  tooltip_options:{
		  fname:{
			  trigger:"focus",  
			   placement:"left"
	  },
		  lname:{
			  trigger:"focus",  
			   placement:"top"
	  },
		  username:{
			  trigger:"focus",  
				   placement:"top"
		  },
		  email:{
			  trigger:"focus", 
				   placement:"left"
		  },
		  password:{
			  trigger:"focus",
				   placement:"left"
		  },
		  confirmPassword:{
			  trigger:"focus",  //or manual
			   placement:"bottom"	  
		  }
	  },
	  errorElement:"span",
	  errorPlacement:function(error,element)
	  {
		  error.addClass("invalid-feedback");
		  element.parents(".form-group").addClass("has-feedback");
		  
		  if(element.prop("type") === "checkbox")
			  {
			  		error.insertAfter(element.parent("label"));
			  }
		  	else {
			  error.insertAfter(element);
		  	}
	  },
	  highlight:function(element,errorClass, validClass){
	  	$(element).addClass("is-invalid").removeClass("is-valid");
	  },
	  unhighlight:function(element,errorClass,validClass){
		  $(element).removeClass("is-invalid").addClass("is-valid");
	  },
	  submitHandler:function(form){
		  form.valid();
	  }
	  
  });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
// $( "#RegisterForm" ).validate({
//     
//     rules:
//         {
//         fname:"required",
//         lname:"required",
//         username: {
//             required:true,
//             minlength:3,
//	           remote:
//	           {
//	        	   url: '/dashboard/checkUsernameAvail',
//	        	   type: "POST",
//	        	   data: {
//	        		          username: function()
//	        		          {
//	        		            return $( "#username_check" ).val();
//	        		          }
//	        	   		}
//	           }
//         },
//         email:
//         {
//             required: true,
//             email: true,
//             remote:
//             {
//               url: '/dashboard/checkEmailAvail',
//               type: "POST",
//               data: {
//		 		          email: function()
//		 		          {
//		 		            return $( "#email_check" ).val();
//		 		          }
// 	   				 }
//             }
//         },
//         password:{
//             required:true,
//             minlength:3
//         },
//         confirmPassword:{
//             required:true,
//            
//             equalTo:"#rPassword"
//         }
//         
//         
//     },
//     messages:{
//         fname:"Enter First Name",
//         lname:"Enter Last Name",
//         username: {
//             required:"Enter your username",
//             minlength:"username should be consist of at least 3 characters",
//             remote: "username is already taken."
//         },
//         email:
//         {
//            required: "Enter your email address.",
//            email: "Enter valid email address.",
//            remote: "Email is already taken"
//         },
//         password: {
//             required:"Enter the password",
//             minlength:"password must be at least 3 characters long"
//         
//         },
//         confirmPassword:
//             {
//             required:"Enter confirm password",
//              equalTo:"Confirm password must be same as Password"
//                 
//             }
//     },
//     
//     tooltip_options:{
//         
//             fname:{
//                 trigger:'focus',
//                 placement:'top'
//             },
//             lname:{
//                 trigger:'focus',
//                 placement:'top'
//             },
//             username: {
//                 trigger:'focus',
//                 placement:'top'
//             },
//             email:{
//                 trigger:'focus',
//                 placement:'top'
//             },
//             password:
//             {
//                 trigger:'focus',
//                 placement:'top'
//             },
//             confirmPassword:
//             {
//                 trigger:'focus',
//                 placement:'top'
//             }
//
//     },
//     submitHandler: function(form)
//     {
//        form.valid();
//     }
//     ,
//     errorElement: "span",
//     errorPlacement: function ( error, element ) {
//         // Add the `help-block` class to the error element
//         error.addClass( "invalid-feedback" );
//
//         // Add `has-feedback` class to the parent div.form-group
//         // in order to add icons to inputs
//         element.parents( ".form-group" ).addClass( "has-feedback" ).css("font-size:15px");
//
//         if ( element.prop( "type" ) === "checkbox" ) {
//             error.insertAfter( element.parent( "label" ) );
//         } else {
//             error.insertAfter( element );
//         }
//      
//      },
//      highlight: function (element, errorClass, validClass) {
//          $(element).addClass('is-invalid').removeClass('is-valid');
//
//          
//      },
//      unhighlight: function (element, errorClass, validClass) {
//          $(element).removeClass('is-invalid').addClass('is-valid');
//  
//      }
//
// 
//    } );
 
// $.validator.addMethod(
//	        "regex",
//	        function(value, element, regexp) {
//	            var re = new RegExp(regexp);
//	            return this.optional(element) || re.test(value);
//	        },
//	        "Please check your input."
//);
 
 
//	$("#email_check").keyup(function(){
//		
//		$.ajax({
//			url : '/dashboard/checkEmailAvail',
//			type: 'GET',
//			data : {email : $("#email_check").val()},
//			success : function(data) {
//				/*$("#email_error").html(data);*/
//				if(data == true)
//				{
//					$("#email_error").addClass("text-danger").html("<h6><i class='fa fa-times text-danger'> &nbsp; Email already exists.</i></h6> ");
//					console.log("Email already exists");
//				}
//				else{
//								$("#email_error").html("");
//						
//					console.log("You can take this email");
//				}
//			}
//		});
//
//	}); 
 
// $('#RegisterForm').on('submit', function(e) {
//	  if(grecaptcha.getResponse() == "") {
//	    e.preventDefault();
//	    $("#gCaptcha").html("<span class='glyphicon glyphicon-remove text-danger'> &nbsp;</span> Please Select ReCaptcha").addClass("text-danger").css("font-size","12px");
//	  } else{
//	    $("#gCaptcha").html("");
//	  }
//	});


//
// $("#username_check").keyup(function() {
//		
//		$.ajax({
//			url : '/dashboard/checkUsernameAvail',
//			type: 'GET',
//			data : {username : $("#username_check").val()},
//			success : function(data) {
//				//$("#username_error").html(data);
//				if(data == true)
//				{
//					//$("#username_error").addClass("text-danger").html("<h6><i class='fa fa-times text-danger'> &nbsp; Username already exists</i> </h6>");
//					$("#username_check").tooltip('show');
//					console.log("Username already exists")
//				}
//				else{
//					$("#username_check").tooltip('hide');
//					$("#username_error").html("");
//					console.log("You can take this username");
//				}
//			}
//		});
//		
//	});
//	


//	$("#forgotemail_check").keyup(function(){
//
//		$.ajax({
//			url : '/user/checkEmailAvail',
//			type: 'GET',
//			data : {email : $("#forgotemail_check").val()},
//			success : function(data) {
//				/*$("#email_error").html(data);*/
//				if(data == true)
//				{
//					$("#forgotemail_error").html("");
//
//					console.log("Email already exists");
//				}
//				else{
//					$("#forgotemail_error").html("Email does not exists. Please Enter correct Input");
//
//					console.log("You can take this email");
//				}
//			}
//		});
//
//	});



	
//$("#LoginForm").submit(function(e){
//	    e.preventDefault();
//		$.ajax({
//			url : '/dashboard/checkUserAvail',
//			type: 'GET',
//			data : {
//				username :$("#username").val(),
//				password :$("#password").val()
//			},
//			success : function(data) {
//				/*$("#email_error").html(data);*/
//				if(data)
//				{
//					//$("#LoginUsernameError").html("<i class='fa fa-times text-danger'>Username not exists. Please Sign Up</i>");
//					$("#modelId").modal('hide');
//					console.log("Logged in successfully");
//				}
//				else{
//					//$("#LoginUsernameError").addClass("text-success").html("<i class='fa fa-check text-success'> &nbsp; Invalid Username And Password</i>");
//					console.log("Login failed");
//					$("#modelId").modal('show');
//				}
//			},
//			error: function(){
//				$("#modelId").modal('show');
//				return false;
//			}
//			
//		});
//
//	});



$("input[type='image']").click(function()
        {
           $("input[id='my_file']").click();
       });

       var readURL = function(input) {
if (input.files && input.files[0]) {
   var reader = new FileReader();

   reader.onload = function (e) {
       $('.profileImage').attr('src', e.target.result);
   }

   reader.readAsDataURL(input.files[0]);
}
}


$("#editSubmitButton").hide();
$("#editCancelButton").hide();

$("#my_file").on('change', function(){
readURL(this);
});

$("#Edit").click(function(){

   $("#FirstNameEdit").removeAttr("disabled");
   $("#LastNameEdit").removeAttr("disabled");

   $("#PhoneEdit").removeAttr("disabled");
   $("#emailEdit").removeAttr("disabled");

   
   $("#editSubmitButton").show("slow");
   
   $("#editCancelButton").show("slow");

});

$("#editCancelButton").click(function(){

   $("#FirstNameEdit").attr("disabled","disabled");
   $("#LastNameEdit").attr("disabled","disabled");

   $("#PhoneEdit").attr("disabled","disabled");
   $("#emailEdit").attr("disabled","disabled");

   $("#editSubmitButton").hide("slow");
   $(this).hide("slow");

});

$("#discount").val("0");

$(".form-group").on('change input','.prc',function(){
    
    $(".form-group .prc").each(function(){
        var price = 0;
        var qty = 0;
        var total = 0;
        price = parseFloat($('#price').val());
        qty = parseFloat($('#quantity').val());



        total = parseFloat($("#total").val());
        
        total = price * qty;

        var cGst = total * 0.025;
        var sGst = total * 0.025;
        
        $("#cGstVal").val(cGst);
        $("#sGstVal").val(sGst);
        var gst = $("#totalGst").val(cGst + sGst);
        var grandTotal = 0;            
        parseFloat($('#total').val(total.toFixed(2)));
        
        $("#discount").keyup(function(){
            //discount
        var total1 = $("#total").val();
        
        var discount = $("#discount").val();
        var dec = (discount/100).toFixed(2);
        var mult = total1 * dec;
        total1 = total1 - mult;

        $("#discountTotal").val(total1);
        grandTotal = total1 + cGst + sGst;    
        $("#grandTotal").val(grandTotal.toFixed(2));
        
    
    });

        $("#price").keyup(function(){
            var total1 = $("#total").val();
            
            var discount = $("#discount").val();
            var dec = (discount/100).toFixed(2);
            var mult = total1 * dec;
            total1 = total1 - mult;
            grandTotal = total1 + cGst + sGst;    
        $("#grandTotal").val(grandTotal.toFixed(2)); 
        
        var gst =cGst + sGst;
        $("#totalGst").val(gst);

        });

        $("#quantity").keyup(function(){
            var total1 = $("#total").val();
            
            var discount = $("#discount").val();
            var dec = (discount/100).toFixed(2);
            var mult = total1 * dec;
            total1 = total1 - mult;
            grandTotal = total1 + cGst + sGst;    
            $("#grandTotal").val(grandTotal.toFixed(2));
        });
        grandTotal = total + cGst + sGst;    
        
        $("#grandTotal").val(grandTotal.toFixed(2));    
    }); 
    
});



//This Working fine
//	 $("#username").keyup(function() {
//			
//			$.ajax({
//				url : '/dashboard/checkUsernameAvail',
//				type: 'GET',
//				data : {username : $("#username").val()},
//				success : function(data) {
//					//$("#username_error").html(data);
//					if(data == true)
//					{
//						$("#LoginUsernameError").addClass("text-success").html("<i class='fa fa-check text-success'> &nbsp; Username exists. You can login...</i>");
//						
//						console.log("Username already exists")
//					}
//					else{
//						$("#LoginUsernameError").html("<i class='fa fa-times text-danger'>Username not exists. Please Sign Up</i>");
//				
//					}
//				}
//			});
//			
//		});


//$("#notification").click(function(){
//	
//	alert("Login First");	
//	if('@Request.authentication' == 'False')
//	{
//		$("#modelId").modal('show');
//	}
//	else {
//		window.location.href='/dashboard/welcome';
//	}
//	
//});




   


$( "#CheckoutForm" ).validate({
	 rules:
	 	{
		 fullname:"required",
		
		 email:{
			required:true,
			email:true,
			
		 },
		 phone: {
			 required:true,
			 minlength:10
		 },
		 address:"required",
		 pincode:{
			 required:true,
			 minlength:6
		 }
		 
		 
	 },
	 messages:{
		 fname:"First Name should not be empty",
		 lname:"Last Name should not be empty",
		 username: {
			 required:"Please enter your username",
			 minlength:"username should be consist of at least 3 characters"
		 },
		 email:{
			 required:"Please enter your email",
			 email:"Enter valid Email"
		 },
	 	password: {
	 		required:"Please enter the password",
	 		minlength:"password must be at least 3 characters long"
	 	
	 	},
	 	confirmPassword:
	 		{
	 		required:"Please enter confirm password",
	 		 equalTo:"Confirm password must be same as Password"
	 			
	 		}
	 },
	 errorElement: "em",
           errorPlacement: function ( error, element ) {
               // Add the `help-block` class to the error element
               error.addClass( "help-block" ).addClass("text-danger").css("font-size","14px");
   
               // Add `has-feedback` class to the parent div.form-group
               // in order to add icons to inputs
               element.parents( ".col-sm-12" ).addClass( "has-feedback" );
   
               if ( element.prop( "type" ) === "checkbox" ) {
                   error.insertAfter( element.parent( "label" ) );
               } else {
                   error.insertAfter( element );
               }
            }
	} );




//$alert = $('.alert');
//if($alert.length) {
//	setTimeout(function() {
//    	$alert.fadeOut('slow');
//	   }, 3000
//	);		
//}


$( "#dealsForm" ).validate({
	 rules:
	 	{
		 d_Name:"required",
		 dealsImage: {
			 required:true,
			 extension: "jpg|jpeg|gif|png"
		 }
		 
		 
		 
	 },
	 messages:{
		 d_Name:"Deal name should not be empty",
		 dealsImage: {
			 required:"Please select file first",
			 extension:"Image should of type jpg,png,jpeg or gif"
		 }
		
	 },
	  errorElement: "span",
    errorPlacement: function ( error, element ) {
        // Add the `help-block` class to the error element
        error.addClass( "invalid-feedback" );

        // Add `has-feedback` class to the parent div.form-group
        // in order to add icons to inputs
        element.parents( ".form-group" ).addClass( "has-feedback" ).css("font-size:15px");

        if ( element.prop( "type" ) === "checkbox" ) {
            error.insertAfter( element.parent( "label" ) );
        } else {
            error.insertAfter( element );
        }
     
     },
     highlight: function (element, errorClass, validClass) {
         $(element).addClass('is-invalid').removeClass('is-valid');

         
     },
     unhighlight: function (element, errorClass, validClass) {
         $(element).removeClass('is-invalid').addClass('is-valid');
 
     }
} );




});
/**** */  