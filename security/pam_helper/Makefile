PORTNAME=	pam_helper
PORTVERSION=	1.2
CATEGORIES=	security sysutils
MASTER_SITES=	http://www.marcuscom.com/pam_helper/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Authenticate applications requiring PAM services

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		tar:bzip2 uidfix

PLIST_FILES=	bin/pam_helper

post-patch:
	@${REINPLACE_CMD} '/BINOWN=/d ; s,$${MINUSLPAM},-lpam,' ${WRKSRC}/Makefile

.include <bsd.port.mk>
