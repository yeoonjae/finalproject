<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    <script>
        $(function(){
            $(axios).get()
        });
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="jumbotron">
            <h1 class="text-center">마일리지 유형 등록</h1>
        </div>
        <div class="row">
            <div class="offset-sm-4 col-sm-4">
                <form action="regist" method="post" class="form">
                    <div class="form-group">
                        <label>유형선택</label>
                        <select name="point_type" class="form-control">
                            <option>적립</option>
                            <option>차감</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>상세내용</label>
                        <input type="text" name="point_detail" placeholder="상세내용을 입력하세요" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>마일리지</label>
                        <input type="text" name="point_score" placeholder="마일리지를 입력하세요" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">등록</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<%-- <jsp:include page="/WEB-INF/views/admin/template/footer.jsp"></jsp:include> --%>