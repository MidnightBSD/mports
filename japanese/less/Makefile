PORTNAME=	less
PORTVERSION=	382.262.03.01
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced less(1) supporting iso-2022-jp and UTF-8
WWW=		http://web.archive.org/web/20070220213232/http://www25.big.or.jp/~jam/less

LICENSE=	gpl2

USES=		desthack ncurses
USE_GITHUB=	yes
GH_ACCOUNT=	hrs-allbsd
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-cs-regex
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
PORTDOCS=	README.iso README.iso.jp README.lesw.euc \
		README.regex README.regex.jp README.ext.jp
PLIST_FILES=	bin/jless bin/jlesskey bin/jlessecho \
		share/man/man1/jless.1.gz share/man/man1/jlesskey.1.gz

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
