<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>

	<%
		if (request.getSession().getAttribute("name") == null) {
	%>
	<%@ include file="../Shared/blankHeader.jsp"%>
	<%
		} else {
	%>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<%
		}
	%>
<div class="jumbotron hero">
        <div class="container">
            <div class="row">
                <div class="col-md-12 get-it">
                    <h1 class="text-center">My pLace Entertainment </h1>
                    <p class="text-center">Welcome to My pLace Entertainment! How can we help you? </p>
                </div>
            </div>
        </div>
    </div>
    <section class="testimonials">
        <h2 class="text-center">Welcome to My pLace Entertainment.</h2>
        <p class="text-center">Some Description of our Website</p>
    </section>
    <section class="features">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1 style="color: white;">Organizations: </h1>
                    <h2>Connect your business events with consumers  around you! </h2>
                    <div class="row">
                        <div>
                            <div class="row icon-features">
                                <div class="icon-feature"><i class="glyphicon glyphicon-plus"></i>
                                    <p>Create Events and provide Updates </p>
                                </div>
                                <div class="icon-feature"><i class="glyphicon glyphicon-user"></i>
                                    <p>Share Events on your profile </p>
                                </div>
                                <div class="icon-feature"><i class="glyphicon glyphicon-list"></i>
                                    <p>Set Guest List and receive RSVP </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h1 style="color: white;">Users: </h1>
                    <h2>Connect yourself and friends to events around  you! </h2>
                    <div class="row">
                        <div>
                            <div class="row icon-features">
                                <div class="icon-feature"><i class="glyphicon glyphicon-eye-open"></i>
                                    <p>See Upcoming Events and Get Updates </p>
                                </div>
                                <div class="icon-feature"><i class="glyphicon glyphicon-user"></i>
                                    <p>Share Events on your profile </p>
                                </div>
                                <div class="icon-feature"><i class="glyphicon glyphicon-list"></i>
                                    <p>Beat the Guest list </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="testimonials">
        <h2 class="text-center">Our Team</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="thumbnail"><img>
                    <div class="caption">
                        <h3>Stephen (Andy) Thacker</h3><a href="mailto:thac0006@algonquinlive.com?Subject=My%20pLace%20Help">Email Me</a>
                        <p>Some blurb about Andy</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="thumbnail"><img>
                    <div class="caption">
                        <h3>Victor Fernandez</h3><a href="mailto:fern0120@algonquinlive.com?Subject=My%20pLace%20Help">Email Me</a>
                        <p>Some blurb about Victor</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="thumbnail"><img>
                    <div class="caption">
                        <h3>Amin Hosseini </h3><a href="mailto:mirm0002@algonquinlive.com?Subject=My%20pLace%20Help">Email Me</a>
                        <p>Some blurb about Amin </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="thumbnail"><img>
                    <div class="caption">
                        <h3>Chris Homecutler </h3><a href="mailto:home0005@algonquinlive.com?Subject=My%20pLace%20Help">Email Me</a>
                        <p>Some blurb about Chris</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@ include file="../Shared/footer.jsp"%>
</body>
</html>