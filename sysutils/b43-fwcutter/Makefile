# Created by: Scot Hetzel <swhetzel@gmail.com>

PORTNAME=	b43-fwcutter
PORTVERSION=	019
CATEGORIES=	sysutils
MASTER_SITES=	https://bues.ch/b43/fwcutter/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Firmware extractor for Broadcom wireless adapters

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

USES=		gmake tar:bzip2

MAKE_ARGS=	V=1

PLIST_FILES=	bin/b43-fwcutter \
		man/man1/b43-fwcutter.1.gz

.include <bsd.port.mk>
