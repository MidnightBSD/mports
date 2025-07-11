PORTNAME=	libgpg-error
DISTVERSION=	1.55
CATEGORIES=	security devel
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components
WWW=		https://www.gnupg.org/software/libgpg-error/

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LIB

USES=		cpe libtool pathfix tar:bzip2
CPE_VENDOR=	gnupg
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET= install-strip

DOCS=		AUTHORS ChangeLog NEWS README
INFO=		gpgrt

CONFIGURE_ARGS=		--enable-static=yes \
			--enable-install-gpg-error-config

OPTIONS_DEFINE=	DOCS NLS TEST
OPTIONS_SUB=	yes

NLS_USES=		gettext iconv
NLS_CONFIGURE_OFF=	--disable-nls
NLS_CONFIGURE_ON=	${ICONV_CONFIGURE_ARG} --with-libintl-prefix=${LOCALBASE}

TEST_CONFIGURE_ENABLE=	tests
TEST_TARGET=	check

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
