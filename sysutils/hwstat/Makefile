# Created by: Marc Lagrange <rhaamo@gruik.at>

PORTNAME=	hwstat
PORTVERSION=	0.5.1
CATEGORIES=	sysutils
MASTER_SITES=	https://BSDforge.com/projects/source/sysutils/hwstat/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line tool to display CPU temp and battery infos

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		uidfix
MAKE_ARGS+=	BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/man/man
PLIST_FILES=	bin/hwstat man/man1/hwstat.1.gz

.include <bsd.port.mk>
