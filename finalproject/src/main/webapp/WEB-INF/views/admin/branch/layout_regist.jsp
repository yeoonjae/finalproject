<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>
    <style>
        #c {
            background-color: grey;
            align-content: center;
        }

        button {
            padding: 10px 20px;
        }
        .save{
        	background-color: white;
        	margin-top: 10px;
        }        
        .container-fluid{
        	width: 60%;
        	margin-top: 20px;
        	align: center;
        }
        .aaa{
        	margin:auto;
        	padding: 0.5rem;
        	position: absolute;
        	z-index: 50;
        }
	</style>
	<div class="container-fluid">
		<div class="row">
			<div class="btns">
				<button class="btn btn-outline-secondary btn-sm" id="rect">사각형</button>
				<button class="btn btn-outline-secondary btn-sm" id="noline">라인없는 사각형</button>
				<button class="btn btn-outline-secondary btn-sm" id="circ">동그라미</button>
				<button class="btn btn-outline-secondary btn-sm" id="remove">지우기</button>
				<button class="btn btn-outline-secondary btn-sm" id="text">텍스트</button>
				<input type="text" id="text-input"><br>
				<br>
				<form action="layout_regist" method="post">
					<a href="#"><button class="btn btn-outline-secondary btn-sm" id="save" style="float:right">배치도 저장</button></a><br>
					<input type="hidden" name="branch_layout">
					<input type="hidden" name="branch_no" value="${param.branch_no}">
				</form>
			</div>

				<br>
			<canvas id="c" width="650" height="400" style="margin-top: 10px;"></canvas>
		</div>
	</div>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fabric@3.6.3/dist/fabric.js"></script>
    <script>
        var canvas = new fabric.Canvas('c');
        
        $("#rect").on("click", function(e) {
            rect = new fabric.Rect({
            left: 300,
            top: 40,
            width: 50,
            height: 50,    
            fill: 'antiquewhite',
            stroke: 'white',
            strokeWidth: 0.1,
                    });  
            canvas.add(rect);
        });
        $("#noline").on("click", function(e) {
            rect = new fabric.Rect({
            left: 300,
            top: 40,
            width: 50,
            height: 50,   
            fill: 'antiquewhite',
            stroke: 'white',
            strokeWidth: 0,
                    });  
            canvas.add(rect);
        });

        $("#circ").on("click", function(e) {
            rect = new fabric.Circle({
                left: 300,
                top: 40,
                radius: 50,     
                fill: 'transparent',
                stroke: 'white',
                strokeWidth: 3,
            });  
            canvas.add(rect);
        });

        $("#save").on("click", function(e) {
//         	$(".save").html(canvas.toSVG());
//             $(".save").html(JSON.stringify(canvas));
// 			$("#c").css("display","none");
// 			$(".btns").css("display","none");
			console.log(JSON.stringify(canvas));
			var layout = document.querySelector("input[type=hidden]");
			layout.value = JSON.stringify(canvas);	

        });

        $("#text").on("click", function(e) {
            var text = new fabric.Text($("#text-input").val(), {left: 100, top: 100 });
            text.set({
            	  fill: 'white',
            	  
            	});
            canvas.add(text);
            canvas.moveTo(text, 20);
            const priority = getMaxAttr(objects, "priority", 0);
            text.setAttribute("priority", priority);
            text.style["z-index"] = priority;
        });
        
        $("#remove").on("click", function(e) {
            var obj = canvas.getActiveObject();
            canvas.remove(obj);
        });

    </script>
<jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include>