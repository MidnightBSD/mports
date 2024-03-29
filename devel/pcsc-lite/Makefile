PORTNAME=	pcsc-lite
PORTVERSION=	2.0.0
CATEGORIES=	devel security
MASTER_SITES=	https://pcsclite.apdu.fr/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Middleware library to access a smart card using SCard API (PC/SC)
WWW=		https://pcsclite.apdu.fr/

LICENSE=	bsd3 gpl3+
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool pathfix perl5 pkgconfig python shebangfix tar:bzip2
USE_LDCONFIG=	yes
USE_PERL5=	build
USE_RC_SUBR=	pcscd
PYTHON_NO_DEPENDS=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-libsystemd \
		--enable-usbdropdir=${PREFIX}/lib/pcsc/drivers/ \
		--enable-ipcdir=/var/run

INSTALL_TARGET=	install-strip
SHEBANG_FILES=	src/spy/pcsc-spy
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS EXAMPLES
OPTIONS_GROUP=		FEATURES
OPTIONS_GROUP_FEATURES=	FILTER
FEATURES_DESC=		Default features knobs
FILTER_DESC=		Control (Ignore or Extend) reader names reported by PCSC
FILTER_CONFIGURE_ENABLE=	filter

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/pcsc/drivers
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/pcsc/services

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/Makefile.am ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/Makefile.in ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/pcsc_demo.c ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
