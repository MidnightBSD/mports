PORTNAME=	gsl
PORTVERSION=	2.5
CATEGORIES=	math
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Scientific Library - mathematical libs

LICENSE=	gpl3

USES=		libtool pathfix
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

NO_TEST=	yes

INFO=		gsl-ref

post-extract:
	@${RM} -f ${WRKSRC}/doc/gsl-ref.info*

#prevent regression test coredumps from causing failures on the
#package-building cluster:
.ifndef(MAINTAINER_MODE)
CORELIMIT?=	/usr/bin/limits -Sc 0
.endif

.include <bsd.port.mk>
