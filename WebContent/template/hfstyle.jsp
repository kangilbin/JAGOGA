<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
	max-height: 400px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

/* Note: Try to remove the following lines to see the effect of CSS positioning */
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix+.container-fluid {
	padding-top: 70px;
}

.title {
	font-family: 'Playball', cursive;
	font-size: 65px;
}

.subtitle {
	font-family: 'Playball', cursive;
}

.log {
	font-family: 'Coiny', cursive;
}

.my, .room {
	font-family: 'Jua', sans-serif;
}

.container-fluid {
	text-align: center;
	
}

</style>