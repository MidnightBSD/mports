PORTNAME=	msghack
PORTVERSION=	0.21
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/rene
PKGNAMEPREFIX=	gettext-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alter gettext po files in special ways
WWW=		https://src.fedoraproject.org/rpms/gettext/blob/master/f/msghack.py

LICENSE=	gpl3+

USES=		python shebangfix tar:xz

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/msghack \
		share/man/man1/msghack.1.gz

SHEBANG_FILES=	msghack.py

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/msghack.py ${PREFIX}/bin/msghack
	${INSTALL_MAN} ${WRKSRC}/msghack.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
