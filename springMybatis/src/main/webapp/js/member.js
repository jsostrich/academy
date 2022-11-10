/**
 * 
 */
 
$(function(){
	$('#email2').change(function(){
       if($(this).val() == "etc"){
    	   	$('#email3').val("");
          	$('#email3').css('visibility', 'visible');
    	   	$('#email3').focus();
       } else {
          	$('#email3').css('visibility', 'hidden');
       }
    });
    
    $('#btnChkId').click(function(){
    	var id=$('#userid').val();
    	open('checkUserid.jsp?userid='+id,'chk',
    		'width=500,height=300,left=0,top=0,location=yes,resizable=yes');	
    });
    
    $('#btnZipcode').click(function(){
    	open('../zipcode/zipcode.jsp','zip',
    		'width=550,height=600,left=0,top=0,location=yes,resizable=yes');	
    });
    
    $('#email2').change(function(){
       if($(this).val() == "etc"){
    	   	$('#email3').val("");
          	$('#email3').css('visibility', 'visible');
    	   	$('#email3').focus();
       } else {
          	$('#email3').css('visibility', 'hidden');
       }
    });
    
    
    $('#btnZipcode').click(function(){
    	open('../zipcode/zipcode.jsp','zip',
    		'width=550,height=600,left=0,top=0,location=yes,resizable=yes');	
    });
    
    
});