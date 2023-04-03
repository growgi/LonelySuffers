<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="section transheader homepage parallax" data-stellar-background-ratio="0.5" style="background-image: url('upload/bg_04.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>Lonely Suffers!</h2>
						<p class="lead">파도타기를 좋아하는 사람들을 위한 웹사이트</p>
						<form class="calculateform">
							<div class="item-box">
								<div class="item-top form-inline">
									<div class="form-group">
										<div class="input-group2">
											<span class="input-addon"> <i class="fa fa-link"></i>
											</span> <input type="url" class="form-control" id="urladres"
												name="url" placeholder="제출 폼">
										</div>
									</div>
									<input type="submit" name="send" value="제출"
										class="btn btn-default" />
								</div>
							</div>
						</form>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<section class="section nopad">
			<div class="container-fluid">
				<div class="row text-center">
					<div class="col-md-3 col-sm-6 nopad first">
						<div class="home-service c1">
							<i class="flaticon-competition"></i>
							<p>마우스 호버 시<br>색깔 변경</p>
						</div>
						<!-- end home-service -->
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 nopad">
						<div class="home-service c2">
							<i class="flaticon-chat"></i>
							<p>마우스 호버 시<br>색깔 변경</p>
						</div>
						<!-- end home-service -->
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 nopad">
						<div class="home-service c3">
							<i class="flaticon-domain"></i>
							<p>마우스 호버 시<br>색깔 변경</p>
						</div>
						<!-- end home-service -->
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 nopad last">
						<div class="home-service c4">
							<i class="flaticon-medal"></i>
							<p>마우스 호버 시<br>색깔 변경</p>
						</div>
						<!-- end home-service -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		<section class="section overfree">
			<div class="icon-center">
				<i class="fa fa-anchor"></i>
			</div>
		</section>



		<section class="section overfree">
			<div class="section-title text-center">
				<h3>숫자 카운터</h3>
				<p>숫자값이 크든 작든, 카운팅은 동시에 끝납니다. 새로고침(F5) 눌러서 숫자를 보세요.</p>
			</div>
			<!-- end section-title -->
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="milestone-counter c1">
							<img src="images/icon_07.png" alt="" class="alignleft">
							<h3 class="stat-count">2901</h3>
							<p>Happy Customers</p>
						</div>
					</div>

					<div class="col-md-4">
						<div class="milestone-counter c2">
							<img src="images/icon_08.png" alt="" class="alignleft">
							<h3 class="stat-count">304</h3>
							<p>Online Strategy</p>
						</div>
					</div>

					<div class="col-md-4">
						<div class="milestone-counter c3">
							<img src="images/icon_09.png" alt="" class="alignleft">
							<h3 class="stat-count">890</h3>
							<p>Great Results</p>
						</div>
					</div>
				</div>
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="about-widget">
							<i class="flaticon-cup"></i>
							<h3>Progress bar</h3>
							<p>
								게이지 바에 차오르는 애니메이션이 있습니다. 새로고침(F5) 눌러서 게이지 바를 보세요.<br>다른 CSS
								디자인은 <a href="https://freefrontend.com/css-progress-bars/">https://freefrontend.com/css-progress-bars/</a>에서
								찾아보시면 됩니다.
							</p>

							<div class="skills-style">
								<div class="skills-wrapper">
									<h3>게이지 78% 까지 상승</h3>
									<div class="progress">
										<div class="progress-bar progress-bar-primary wow slideInLeft"
											role="progressbar" aria-valuenow="78" aria-valuemin="0"
											aria-valuemax="100" style="width: 78%"></div>
									</div>
								</div>
								<!-- end skills-wrapper -->

								<div class="skills-wrapper">
									<h3>게이지 90% 까지 상승</h3>
									<div class="progress">
										<div class="progress-bar progress-bar-primary wow slideInLeft"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 90%"></div>
									</div>
								</div>
								<!-- end skills-wrapper -->

								<div class="skills-wrapper">
									<h3>게이지 60% 까지 상승</h3>
									<div class="progress">
										<div class="progress-bar progress-bar-primary wow slideInLeft"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%"></div>
									</div>
								</div>
								<!-- end skills-wrapper -->

								<div class="skills-wrapper">
									<h3>게이지 95% 까지 상승</h3>
									<div class="progress">
										<div class="progress-bar progress-bar-primary wow slideInLeft"
											role="progressbar" aria-valuenow="95" aria-valuemin="0"
											aria-valuemax="100" style="width: 95%"></div>
									</div>
								</div>
								<!-- end skills-wrapper -->
							</div>
							<!-- end skills -->
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->

					<div class="col-md-7">
						<div class="about-img">
							<img src="upload/browser_01.png" alt="" class="img-responsive">
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="seo-score">
							<div class="website-screen">
								<img src="upload/seo_screen.png" alt="" class="img-responsive">
							</div>
							<!-- end website-screen -->

							<div>색깔이 움직이는 게이지</div>
							<div class="circle-detail">
								<div class="progress">
									<div class="progress-bar progress-bar-striped active"
										role="progressbar" aria-valuenow="67" aria-valuemin="0"
										aria-valuemax="100" style="width: 67%">
										<span>67</span>
									</div>
								</div>
							</div>
							<!-- end circle -->

							<div class="seo-details">
								<table class="table">
									<tbody>
										<tr class="row">
											<td class="first-col col-md-4 good">Good</td>
											<td class="col-md-8">12/24</td>
										</tr>
										<tr class="row">
											<td class="first-col col-md-4 bad">Bad</td>
											<td class="col-md-8">3/24</td>
										</tr>
									</tbody>
								</table>
								<a href="#" class="btn btn-primary btn-block btn-lg">Increase
									Your SEO Score</a>
							</div>
						</div>
						<!-- end score -->
					</div>
					<!-- end col -->

					<div class="col-md-8">
						<div class="seo-details">
							<table class="table">
								<thead>
									<tr class="row">
										<th class="col-md-4"><i class="fa fa-search"></i> SEO
											Analysis</th>
										<th class="col-md-8">Site Details</th>
									</tr>
								</thead>
								<tbody>
									<tr class="row">
										<td class="first-col col-md-4 good">HTML Version</td>
										<td class="col-md-8">Perfect! You are using the HTML5
											version</td>
									</tr>
									<tr class="row">
										<td class="first-col col-md-4 good">Character encoding</td>
										<td class="col-md-8">Perfect! Your character encoding
											supports all languages</td>
									</tr>
									<tr class="row">
										<td class="first-col col-md-4 good">Site Title</td>
										<td class="col-md-8">Fantastic! Title tag is fully
											compatible with SEO</td>
									</tr>
									<tr class="row">
										<td class="first-col col-md-4 good">Site Description</td>
										<td class="col-md-8">Fantastic! Site description is fully
											compatible with SEO</td>
									</tr>
									<tr class="row">
										<td class="first-col col-md-4 good">Canonical</td>
										<td class="col-md-8">Perfect! The "Canonical" tags on
											your site are mukvut and url is structured correctly</td>
									</tr>
									<tr class="row">
										<td class="first-col col-md-4 good">Favicon</td>
										<td class="col-md-8">Awesome! Your site provide a favicon</td>
									</tr>
									<tr class="row">
										<td class="first-col col-md-4 good">H1 Heading Elements</td>
										<td class="col-md-8">Good! There is (1) H1 tag on your
											web site.
											<ul>
												<li>A real time search engine optimization</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- end details -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="feature-widget">
							<h3>위쪽에서 날아오며 등장</h3>
							<p>
								Morbi quis porta dolor. Nullam feugiat sapien et libero
								elementum faucibus. Praesent sagittis venenatis ipsum, eget
								tristique odio pharetra quis. Sed maximus a eros quis ornare.
								Proin tempor dolor a auctor convallis. The screen from <a
									href="https://moz.com/explorer">Moz</a> thanks for the awesome
								tool!
							</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->

					<div class="col-md-6">
						<div class="feature-img">
							<img src="upload/screen_04.jpg" alt=""
								class="img-responsive wow fadeInDown">
						</div>
					</div>
				</div>
				<!-- end row -->

				<hr class="invis1">

				<div class="row">
					<div class="col-md-6">
						<div class="feature-img">
							<img src="upload/screen_05.jpg" alt=""
								class="img-responsive wow fadeInLeft">
						</div>
					</div>

					<div class="col-md-6">
						<div class="feature-widget">
							<h3>왼쪽에서 날아오며 등장</h3>
							<p>Morbi quis porta dolor. Nullam feugiat sapien et libero
								elementum faucibus. Praesent sagittis venenatis ipsum, eget
								tristique odio pharetra quis. Sed maximus a eros quis ornare.
								Proin tempor dolor a auctor convallis. Nam accumsan commodo
								elit..</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<hr class="invis1">

				<div class="row">
					<div class="col-md-6">
						<div class="feature-widget">
							<h3>오른쪽에서 날아오며 등장</h3>
							<p>Morbi quis porta dolor. Nullam feugiat sapien et libero
								elementum faucibus. Praesent sagittis venenatis ipsum, eget
								tristique odio pharetra quis. Sed maximus a eros quis ornare.
								Proin tempor dolor a auctor convallis. Nam accumsan commodo
								elit..</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->

					<div class="col-md-6">
						<div class="feature-img">
							<img src="upload/screen_06.jpg" alt=""
								class="img-responsive wow fadeInRight">
						</div>
					</div>
				</div>
				<!-- end row -->

				<hr class="invis1">

				<div class="row">
					<div class="col-md-6">
						<div class="feature-img">
							<img src="upload/screen_07.jpg" alt=""
								class="img-responsive wow fadeInUp">
						</div>
					</div>

					<div class="col-md-6">
						<div class="feature-widget">
							<h3>아래쪽에서 날아오며 등장</h3>
							<p>
								Morbi quis porta dolor. Nullam feugiat sapien et libero
								elementum faucibus. Praesent sagittis venenatis ipsum, eget
								tristique odio pharetra quis. Sed maximus a eros quis ornare.
								Proin tempor dolor a auctor convallis. Check the awesome tool <a
									href="https://moz.com/researchtools/ose/">Moz Search</a>
							</p>
						</div>
						<!-- end about-widget -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<hr class="invis1">

				<div class="row callout bgcolor">
					<div class="col-md-9">
						<p class="lead">가로형(row) 배너 디자인<br>그림자 효과 들어가 있음<br>애니메이션 효과 없음</p>
					</div>
					<div class="col-md-3">
						<div class="button-wrap text-center">
							<a href="#" class="btn btn-transparent btn-light btn-lg">A태그가 포함된 버튼</a>
						</div>
					</div>
				</div>
			</div>
		</section>



		<section class="section overfree">
			<div class="icon-center">
				<i class="fa fa-code"></i>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="design-title">
							<small>Quality Website Templates</small>
							<h4>옆의 사진이 서서히 등장 (Fade in)</h4>
							<p class="lead">Quisque eget nisl id nulla quis id. Aliquam
								quis vehicula enim, non aliquam risus. Sed a tellus quis mi
								rhoncus dignissim.</p>

							<p>Integer rutrum ligula eu dignissim laoreet. Pellentesque
								venenatis nibh sed tellus faucibus bibendum. Sed fermentum est
								vitae rhoncus molestie. Cum sociis natoque penatibus et magnis
								dis parturient montes, nascetur ridiculus mus. Sed vitae rutrum
								neque. Ut id erat sit amet libero bibendum aliquam. Donec ac
								egestas libero, eu bibendum risus. Phasellus et congue justo.</p>

							<a href="#" class="btn btn-transparent">Get a Quote</a>

						</div>
						<!-- end website-design -->
					</div>
					<!-- end col -->

					<div class="col-md-6">
						<div class="post-media wow fadeIn">
							<img src="upload/seo_screen.png" alt="" class="img-responsive">
						</div>
						<!-- end media -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<hr class="invis">

				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="icon-wrapper wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.2s">
							<i class="flaticon-content alignleft"></i>
							<h3>가로 3개 객체들이</h3>
							<p>Our Landigoo responsive site template elements 100%
								compatible with all mobile devices and modern browsers!</p>
						</div>
						<!-- end icon-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="icon-wrapper wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.4s">
							<i class="flaticon-html alignleft"></i>
							<h3>차례로</h3>
							<p>We offer pixel perfect icons, graphic sources for
								high-resolution devices! Landigoo compatible retina display!</p>
						</div>
						<!-- end icon-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="icon-wrapper wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.6s">
							<i class="flaticon-chat alignleft"></i>
							<h3>서서히 등장</h3>
							<p>When you need anything about for Landigoo template, just
								drop an email or leave a feedback from TF!</p>
						</div>
						<!-- end icon-wrapper -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<section class="section bt">
			<div class="container">
				<div class="section-title text-center">
					<small>Our search engine optimization works and happy
						customers in the past.</small>
					<h3>캐러셀(Carousel)</h3>
					<p>자동 슬라이드는 따로 스크립트 더 넣어줘야 가능<br>사진 위에 마우스 호버 시 효과 있음</p>
				</div>
				<!-- end section-title -->

				<div class="owl-carousel owl-theme lightcasestudies withhover">
					<div class="item-carousel">
						<div class="case-box">
							<img src="upload/case_01.png" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="upload/case_07.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="upload/case_03.png" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="upload/case_02.png" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="upload/case_05.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="item-carousel">
						<div class="case-box">
							<img src="upload/case_06.jpg" alt="" class="img-responsive">
							<div class="magnifier">
								<a href="case-studies-single.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->
				</div>
			</div>
		</section>

		<section class="section lb nopad spotlight style1">
			<div class="content">
				<h2>등장 애니메이션 없음</h2>
				<p>Donec congue odio in mi finibus dignissim. Etiam faucibus
					pharetra euismod. Pellentesque malesuada et ligula et scelerisque.
					Pellentesque aliquet magna ut dolor consequat, luctus tincidunt
					metus consequat. Nam eu mattis ante, nec facilisis purus. Praesent
					ac venenatis erat. Interdum et malesuada fames ac ante ipsum primis
					in faucibus. Integer tincidunt finibus.</p>
				<a href="#" class="btn btn-transparent">Learn More</a>
			</div>
			<div class="image col-md-4 hidden-sm hidden-xs">
				<img src="upload/blog_alt_01.jpg" alt="" />
			</div>
		</section>



		<section class="section">
			<div class="container">
				<div class="section-title text-center">
					<h3>말풍선 디자인</h3>
					<hr>
					<p class="lead">고객들의 후기 등</p>
				</div>
				<!-- end section-title -->
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12 first">
						<div class="testimonial-wrapper">
							<div class="testimonial-box">
								<small>CEO - Envato Elements</small>
								<h4>Martin Hopkens</h4>
								<p class="lead">Thanks to the seo service I bought from this
									site, my website is ranked number 1 in Google rankings.</p>
							</div>
							<!-- end testimonial-box -->
							<img src="upload/team_03.jpeg" alt="" class="img-circle">
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="testimonial-wrapper">
							<div class="testimonial-box">
								<small>CEO - WP Servis</small>
								<h4>Adam Colline</h4>
								<p class="lead">When I need high rank on Google, the SeoTime
									make my website awesome! If you are high-quality backlinks just
									try SeoTime!.</p>
							</div>
							<!-- end testimonial-box -->
							<img src="upload/team_01.jpeg" alt="" class="img-circle">
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12 last">
						<div class="testimonial-wrapper">
							<div class="testimonial-box">
								<small>CEO - Bananis</small>
								<h4>Steave Johns</h4>
								<p class="lead">Just purchased a professional SEO pack on
									this website and now my blog 1st rank on Google!</p>
							</div>
							<!-- end testimonial-box -->
							<img src="upload/team_02.jpeg" alt="" class="img-circle">
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12 first">
						<div class="testimonial-wrapper">
							<div class="testimonial-box">
								<small>Freelancer</small>
								<h4>Jack Jakson</h4>
								<p class="lead">If you want to make a high income on your
									website I offer you a professional package.</p>
							</div>
							<!-- end testimonial-box -->
							<img src="upload/team_04.jpg" alt="" class="img-circle">
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="testimonial-wrapper">
							<div class="testimonial-box">
								<small>Wikipedia</small>
								<h4>Boby Sluter</h4>
								<p class="lead">Thanks to this company, the number of
									visitors to the site increased rapidly. I was not impressed by
									the latest Google update.</p>
							</div>
							<!-- end testimonial-box -->
							<img src="upload/team_05.jpg" alt="" class="img-circle">
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->

					<div class="col-md-4 col-sm-6 col-xs-12 last">
						<div class="testimonial-wrapper">
							<div class="testimonial-box">
								<small>British Musium</small>
								<h4>Brad Babsksens</h4>
								<p class="lead">SEO business is important, I would recommend
									anyone to the site of SeoTime, the number one company in the
									world that makes this job the best.</p>
							</div>
							<!-- end testimonial-box -->
							<img src="upload/team_06.jpg" alt="" class="img-circle">
						</div>
						<!-- end testimonial-wrapper -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




		<section class="section bt">
			<div class="container">
				<div class="section-title text-center">
					<h3>마우스 호버 시 커지는 객체들</h3>
					<hr>
					<p class="lead">SeoTime is recognized as a Top Search Engine Optimization Agency by;</p>
				</div>
				<!-- end section-title -->

				<div class="row clientv2">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="upload/client_01.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="upload/client_02.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="upload/client_08.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="client-box">
							<a href="#"><img src="upload/client_04.png" alt=""
								class="img-responsive"></a>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 mb30">
						<div class="faqs-template">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne">
											<h4 class="panel-title">
												1. 아코디언 메뉴 <i class="fa fa-angle-down"></i>
											</h4>
										</a>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>All major search engines such as Google, Bing and
												Yahoo have primary search results, where web pages and other
												content such as videos or local listings are shown and
												ranked based on what the search engine considers most
												relevant to users. Payment isn’t involved, as it is with
												paid search ads.</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo">
											<h4 class="panel-title">
												2. 동시에 펼쳐지지 않는 방식 <i class="fa fa-angle-down"></i>
											</h4>
										</a>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												Bootstrap is a powerful front-end framework for faster and
												easier web development. It is a collection of CSS and HTML
												conventions. <a href="#" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree">
											<h4 class="panel-title">
												3. 하나가 펼쳐지면 나머지는 자동으로 접힘 <i class="fa fa-angle-down"></i>
											</h4>
										</a>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												CSS stands for Cascading Style Sheet. CSS allows you to
												specify various style properties for a given HTML element
												such as colors, backgrounds, fonts etc. <a href="#"
													target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end faqs-template -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<section class="section lb">
			<div class="container">
				<div class="section-title text-center">
					<h3>포토 카드</h3>
					<hr>
					<p class="lead">Our search engine optimization works and happy customers in the past.</p>
				</div>
				<!-- end section-title -->

				<div class="row lightcasestudies">
					<div class="col-md-4">
						<div class="case-box">
							<img src="upload/case_04.jpg" alt="" class="img-responsive">
							<div class="case-info clearfix">
								<div class="pull-left">
									<h4>Carbon Beauty</h4>
									<small>Backlink Service</small>
								</div>
								<span class="case-link pull-right"><a
									href="case-studies-single.html"><i class="fa fa-link"></i></a></span>
							</div>
							<!-- end case-info -->
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="col-md-4">
						<div class="case-box">
							<img src="upload/case_05.jpg" alt="" class="img-responsive">
							<div class="case-info clearfix">
								<div class="pull-left">
									<h4>Denicler</h4>
									<small>1nd Place Success</small>
								</div>
								<span class="case-link pull-right"><a
									href="case-studies-single.html"><i class="fa fa-link"></i></a></span>
							</div>
							<!-- end case-info -->
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->

					<div class="col-md-4">
						<div class="case-box">
							<img src="upload/case_06.jpg" alt="" class="img-responsive">
							<div class="case-info clearfix">
								<div class="pull-left">
									<h4>KendPark</h4>
									<small>SEO / SEM</small>
								</div>
								<span class="case-link pull-right"><a
									href="case-studies-single.html"><i class="fa fa-link"></i></a></span>
							</div>
							<!-- end case-info -->
						</div>
						<!-- end case-box -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="js/owl.carousel.js"></script>

</body>
</html>