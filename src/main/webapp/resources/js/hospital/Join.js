$(document).ready(function() {
    $("#hospitalJoin").validate({ // userJoin에 validate를 적용
        rules:{
        	hospitalId:{
            	required:true 
            	, rangelength:[5,10]
    			, remote:{
    				type:"post",
    				url:"/hospital/check_id"
    			}
            },
            // required는 필수, rangelength는 글자 개수(5~10개 사이)
            hospitalPw:{required:true, rangelength:[5,10]},
            hospitalPw2:{required:true, equalTo:"#hospitalPw"},
            // equalTo : id가 password인 값과 같아야함
            hospitalName:"required", // 검증값이 하나일 경우 이와 같이도 가능
            hospitalEmail:{
            	required:true
            	, email:true
    			, remote:{
    				type:"post",
    				url:"/hospital/check_email"
    			} 
            },
            // email 형식 검증
            hospitalPhone:{required:true, phone: true},
            // phone 형식 검증
            hospitalAddress:"required",
            hospitalIntro:"required"	
        },
        messages:{  //rules에 해당하는 메시지를 지정하는 속성
        	hospitalId:{
                required:"ID를 입력하세요.",
                rangelength:"5글자 이상, 10글자 이하여야 합니다.",
                remote: "이미 존재하는 아이디입니다."
            },
            hospitalPw:{
                required:"비밀번호를 입력하세요.",
                rangelength:"5글자 이상, 10글자 이하여야 합니다."
            },
            hospitalPw2:{
                required:"비밀번호를 다시 입력하세요.",
                equalTo:"비밀번호가 서로 일치하지 않습니다."
            },
            hospitalName:{
                required:"이름을 입력하세요."
            },
            hospitalEmail:{
                required:"이메일을 입력하세요.",
                email: "이메일 형식이 아닙니다. ",
                remote: "이미 존재하는 이메일입니다."
            },
            hospitalPhone:{
                required:"휴대전화번호를 입력하세요.",
                phone:"'-' 를 제외한 숫자만 적어주세요."
            },
            hospitalAddress:{
                required:"주소를 입력하세요."
            },
            hospitalIntro:{
                required:"병원 소개란을 작성해주세요."
            }
        }     
    });
});

