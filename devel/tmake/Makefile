# $MidnightBSD$
# $FreeBSD: ports/devel/tmake/Makefile,v 1.16 2006/12/06 17:54:34 rafan Exp $

PORTNAME=	tmake
PORTVERSION=	2.12
CATEGORIES=	devel perl5
MASTER_SITES=	SF \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely portable perl-based make utility

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
NO_BUILD=	yes
REINPLACE_ARGS=	-i ''
USES=		perl5 shebangfix zip

SHEBANG_FILES=	bin/progen bin/tmake

post-patch:
	@${RM} ${WRKSRC}/lib/make/generic.t.orig
	@${REINPLACE_CMD} \
		-e 's|/usr/local|${LOCALBASE}|' \
		-e 's|/usr/X11R6|${LOCALBASE}|' \
		-e '/^TMAKE_CFLAGS_RELEASE/ s| -O[0-9]||' \
			${WRKSRC}/lib/freebsd-g++/tmake.conf

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/
	cd ${WRKSRC}/bin/ && ${INSTALL_SCRIPT} progen tmake ${STAGEDIR}${PREFIX}/bin/
	cd ${WRKSRC}/lib/ && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}/
	@${ECHO_MSG}
	@${ECHO_MSG} "Make sure to set your TMAKEPATH environment variable"
	@${ECHO_MSG} "to ${DATADIR}/freebsd-g++."
	@${ECHO_MSG}

.include <bsd.port.mk>
