PORTNAME=	cpp11
DISTVERSION=	0.5.2
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++11 Interface for R's C Interface
WWW=		https://cran.r-project.org/web/packages/cpp11/

LICENSE=	mit

USES=		cran:auto-plist

# circular dep plus test harness issue
NO_TEST=	yes

pre-test:
# R-cran-bench package does not exist yet
	@${LOCALBASE}/bin/Rscript -e 'install.packages("bench", \
		repos = "https://cloud.r-project.org")'

.include <bsd.port.mk>
