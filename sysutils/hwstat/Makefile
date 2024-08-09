PORTNAME=	hwstat
PORTVERSION=	0.5.1
CATEGORIES=	sysutils
MASTER_SITES=	https://BSDforge.com/projects/source/sysutils/hwstat/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line tool to display CPU temp and battery infos
WWW=		https://BSDforge.com/projects/sysutils/hwstat/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		uidfix
MAKE_ARGS+=	BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/share/man/man
PLIST_FILES=	bin/hwstat share/man/man1/hwstat.1.gz

.include <bsd.port.mk>
