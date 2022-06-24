<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer -->
				<section id="footer">
					<div class="container">
						<div class="row">
							<div class="col-12">
									<ul class="links">
										<li>
											<h3>주소</h3>
											<p>
												가자 GO<br>
												(04058) 서울 마포구 신촌로 94 
											</p>
										</li>
										<li>
											<h3>Mail</h3>
											<p><a href="#">gaja_go@naver.com</a></p>
										</li>
										<li>
											<h3>Phone</h3>
											<p>(02) 999-9999</p>
										</li>
									</ul>

							</div>
							<div class="col-12">
								<!-- Copyright -->
									<div id="copyright">
										<ul class="links">
											<li>&copy; Untitled. All rights reserved.</li>
										</ul>
									</div>
									<div style="text-align: right;">
									<c:choose>
										<c:when test="${sessionScope.adminid == null and sessionScope.id == null}">
											<a href="/admin/login.do">관리자 로그인</a>
										</c:when>
										<c:when test="${sessionScope.adminid != null and sessionScope.id == null}">
											<a href="/admin/logout.do">♥관리자 로그아웃♥</a>
										</c:when>
									</c:choose>
									</div>
							</div>
						</div>
					</div>
				</section>
<!-- //Footer -->
			
		</div>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/jquery.dropotron.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>