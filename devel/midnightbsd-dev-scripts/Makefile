# This port is self contained in the src directory.

PORTNAME=	midnightbsd-dev-scripts
PORTVERSION=	1.0
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helper scripts for MidnightBSD development

LICENSE=	bsd2

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/src
USES=		perl5
USE_PERL5_RUN=	yes

SRC=		${.CURDIR}/src

pre-patch:
	@${CP} -R ${SRC} ${WRKDIR}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|' \
		${WRKSRC}/d \
		${WRKSRC}/sd

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/d \
	    ${PREFIX}/bin/d
	${INSTALL_SCRIPT} ${WRKSRC}/sd \
	    ${PREFIX}/bin/sd

.include <bsd.port.mk>
