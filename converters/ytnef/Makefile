# Created by: Rodrigo Graeff <delphus@gmail.com>

PORTNAME=	ytnef
PORTVERSION=	2.0
DISTVERSIONPREFIX=	v
PORTEPOCH=	1
CATEGORIES=	converters mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unpack data in MS Outlook TNEF format

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	p5-MIME-Tools>=0:mail/p5-MIME-Tools

USES=		autoreconf cpe libtool pathfix perl5 shebangfix

USE_GITHUB=	yes
GH_ACCOUNT=	Yeraze
CPE_VENDOR=	ytnef_project
USE_PERL5=	run

SHEBANG_FILES=	ytnef/ytnefprocess
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin|${PREFIX}/bin|' \
		${WRKSRC}/ytnef/ytnefprocess

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
