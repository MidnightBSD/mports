PORTNAME=	ezjail
PORTVERSION=	3.4.2
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://erdgeist.org/arts/software/ezjail/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework to easily create, manipulate, and run BSD jails
WWW=		https://erdgeist.org/arts/software/ezjail/

LICENSE=	other
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		tar:bzip2
FAKE_OPTS=	trueprefix

post-patch:
	@${REINPLACE_CMD} -e 's|man/man|share/man/man|g' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
