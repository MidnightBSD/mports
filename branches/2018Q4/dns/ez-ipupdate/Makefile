# $MidnightBSD$

PORTNAME=	ez-ipupdate
PORTVERSION=	3.0.11b8
PORTREVISION=	5
CATEGORIES=	dns
MASTER_SITES=	http://dyn.pl/client/UNIX/ez-ipupdate/ \
		http://www.yi.org/help/software/ \
		http://www.devil-linux.us/pub/devel/sources/1.3/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Update your host name on any dynamic DNS service

LICENSE=	gpl2

USE_RC_SUBR=	ez-ipupdate
GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	EXAMPLES

post-install:
	@${MKDIR} ${TARGETDIR}/share/examples/${PORTNAME}
	for f in ${WRKSRC}/example-*.conf; \
	do \
		${INSTALL_DATA} $$f ${TARGETDIR}/share/examples/${PORTNAME}/; \
	done
	@${INSTALL_DATA} ${WRKSRC}/example.conf \
			${TARGETDIR}/etc/${PORTNAME}.conf.sample

.include <bsd.port.mk>
