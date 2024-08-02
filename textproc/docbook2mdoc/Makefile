PORTNAME=	docbook2mdoc
PORTVERSION=	1.1.0
CATEGORIES=	textproc
MASTER_SITES=	http://mdocml.bsd.lv/docbook2mdoc/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert DocBook refentry to mdoc
WWW=		https://mdocml.bsd.lv/docbook2mdoc/

LICENSE=	iscl

USES=	tar:tgz

PLIST_FILES=	bin/docbook2mdoc \
		share/man/man1/docbook2mdoc.1.gz

MAKE_ARGS=	PREFIX="${PREFIX}"

post-patch:
	@${REINPLACE_CMD} -e 's|man/man1|share/man/man1|g' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
