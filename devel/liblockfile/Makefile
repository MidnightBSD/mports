# Created by: Yasuhiro KIMURA <yasu@utahime.org>

PORTNAME=	liblockfile
PORTVERSION=	1.14
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard lockfile library

LICENSE=		gpl2 lgpl2.1
LICENSE_COMB=		multi
LICENSE_FILE_gpl2=	${WRKSRC}/licenses/GPL-2
LICENSE_FILE_lgpl2.1=	${WRKSRC}/licenses/LGPL-2

USE_GITHUB=	yes
GH_ACCOUNT=	miquels

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --with-mailgroup

USE_LDCONFIG=	yes

PORTDOCS=	Changelog README

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}/${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
