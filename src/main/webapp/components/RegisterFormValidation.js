
						
							var uid, pwd, cpwd, regBtn, passwordValid, confirmPassword, validUserId;
							window.addEventListener("load", () => {
		                        uid = document.getElementById("userid");
		                        pwd = document.getElementById("pwd");
		                        cpwd = document.getElementById("cpwd");
		                        regBtn = document.getElementById("registerBtn");
		                        passwordValid = false;
		                        confirmPassword = false;
		                        validUserId = false;
							})

							
						function disableRegBtn(){
		                   	 regBtn.disabled = true;
		                   	 	//console.log("Disabled");
						}
						
						function enableRegBtn(){
							//console.log("user? ", validUserId, " pwd? ", passwordValid);
		                     if(validUserId == true && passwordValid == true)
		                   	 {
		                   	 	regBtn.disabled = false;
		                   	 	//console.log("Enabled");
		                   	 }
		                     else
		                    	 disableRegBtn();
						}
                        
                        function setValidUserId(value){
                        	validUserId = value;
                        }
                        
                        function useridChanged(){
                        	//console.log("Userid Changed.");
                        	if(validUserId == true)
                       		{
                            	//console.log("Username Changed after verification");
                       			setValidUserId(false);
                       			disableRegBtn();
                       			document.getElementById('instruction-userid').style.color = 'rgba(0, 0, 255, 0.7)';
                       			document.getElementById('instruction-userid').innerHTML = "Username changed after verfication. Verify it again.";
                       		}
                        }
                        
                        function validateUserId() {
                        	let instruction_uid = document.getElementById('instruction-userid');
                        	instruction_uid.style.color = 'rgba(0, 0, 255, 0.7)';
                        	instruction_uid.innerHTML = "Loading...";
                        	
                        	let userid = uid.value;
                        	
                        	let xhr = new XMLHttpRequest();
                        	
                        	xhr.onreadystatechange = () => {
                     		if (xhr.readyState == 4 && xhr.status == 200) {
                     			//console.log("Response: ", xhr.responseText);
								if(xhr.responseText == "true"){
									instruction_uid.style.color = 'rgba(0, 255, 0, 0.7)';
								    instruction_uid.innerHTML = "Username Available";
								    setValidUserId(true);
								    enableRegBtn();
								   }
									else if(xhr.responseText == "false"){
										disableRegBtn();
										setValidUserId(false);
										instruction_uid.style.color = 'rgba(255, 0, 0, 0.7)';
										instruction_uid.innerHTML = "Username already in use. Try Again with something unique and check for availability";
									}else if(xhr.responseText == "error"){
										setValidUserId(false);
										disableRegBtn();
										instruction_uid.style.color = 'rgba(255, 0, 0, 0.7)';
								            instruction_uid.innerHTML = "Something went wrong. try again letter.";
								          }
								}
                        	 }
                        	
                        	xhr.open("GET", "checkUserId?username="+userid, true);
                        	
                        	xhr.send();
                      }


                        function validatePwd() {
                        	
                            let instructionspwd = Array();
                            instructionspwd[0] = document.getElementById("instruction-pwd-1");
                            instructionspwd[1] = document.getElementById("instruction-pwd-2");
                            instructionspwd[2] = document.getElementById("instruction-pwd-3");
                            instructionspwd[3] = document.getElementById("instruction-pwd-4");
                            instructionspwd[4] = document.getElementById("instruction-pwd-5");

                            let count = 0;
                            let password = pwd.value;

                            if (password.length > 0) {

                                if (password.length >= 8) {
                                    instructionspwd[0].hidden = true;
                                    count++;
                                } else if (password.length <= 10) {
                                    instructionspwd[0].hidden = false;
                                    count--;
                                }

                                if (/[A-Z]+/.test(password)) {
                                    instructionspwd[1].hidden = true;
                                    count++;
                                } else {
                                    instructionspwd[1].hidden = false;
                                    count--;
                                }

                                if (/[a-z]+/.test(password)) {
                                    instructionspwd[2].hidden = true;
                                    count++;
                                } else {
                                    instructionspwd[2].hidden = false;
                                    count--;
                                }

                                if (/\d/.test(password)) {
                                    instructionspwd[3].hidden = true;
                                    count++;
                                } else {
                                    instructionspwd[3].hidden = false;
                                    count--;
                                }

                                if (/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(password)) {
                                    instructionspwd[4].hidden = true;
                                    count++;
                                } else {
                                    instructionspwd[4].hidden = false;
                                    count--;
                                }

                                if (count == 5) {
                                    document.getElementById('pwd-check').style.display = 'block';
                                    passwordValid = true;
                                    validateCpwd();
                                }
                                else {
                                    document.getElementById('pwd-check').style.display = 'none';
                                    passwordValid = false;
                                }
                            }
                        }

                        function validateCpwd() {
                        	disableRegBtn();
                            const password = pwd.value;
                            let cpassword = cpwd.value;
                            //console.log(password, ' ', cpassword);

                            if (password.length > 0 && password == cpassword && passwordValid) {
                                //console.log("matched");
                                document.getElementById('instruction-cpwd').hidden = true;
                                document.getElementById('cpwd-check').style.display = "block";
                                confirmPassword = true;
                                enableRegBtn();
                            } else {
                                document.getElementById('instruction-cpwd').hidden = false;
                                document.getElementById('cpwd-check').style.display = "none";
                                confirmPassword = false;
                            }
                        }
                  