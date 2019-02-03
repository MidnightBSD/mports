# $MidnightBSD$
# $FreeBSD: ports/devel/pcsc-lite/Makefile,v 1.39 2008/03/20 09:37:20 pav Exp $

PORTNAME=	pcsc-lite
PORTVERSION=	1.8.13
CATEGORIES=	devel security
MASTER_SITES=	https://alioth.debian.org/frs/download.php/file/4126/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Smartcard development library

LICENSE=	bsd3

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gmake libtool pathfix perl5 pkgconfig shebangfix tar:bzip2
USE_PERL5=	build
USE_RC_SUBR=	pcscd
SHEBANG_FILES=	${WRKSRC}/src/spy/pcsc-spy

USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-usbdropdir=${PREFIX}/lib/pcsc/drivers/ \
		LIBUSB_CFLAGS=" " LIBUSB_LIBS="-lusb"

PKGMESSAGE=	${WRKDIR}/pkg-message

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.mport.options.mk>

FETCH_DEPENDS=	wget:${PORTSDIR}/ftp/wget
DISABLE_SIZE=	yes
FETCH_CMD=	${LOCALBASE}/bin/wget -c -nc --no-check-certificate

post-patch:
	${REINPLACE_CMD} -e "s,^datadir,#datadir,; s,^data_DATA,#data_DATA," \
		${WRKSRC}/doc/Makefile.in
	${REINPLACE_CMD} -e "s,libusb-1.0/libusb.h,libusb.h,; \
		s,libusb_strerror(ret),ret," ${WRKSRC}/configure \
			${WRKSRC}/src/hotplug_libusb.c
	${REINPLACE_CMD} -e "s,-ldl,," ${WRKSRC}/src/spy/Makefile.in
.if ! ${PORT_OPTIONS:MDOCS}
	${REINPLACE_CMD} -e '/^install-data-am: / s|install-docDATA||' ${WRKSRC}/doc/Makefile.in
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/README.DAEMON ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/Makefile.am ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/Makefile.in ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/pcsc_demo.c ${EXAMPLESDIR}
	@${MKDIR} ${PREFIX}/lib/pcsc/drivers
	@${MKDIR} ${PREFIX}/lib/pcsc/services
	${TOUCH} ${PREFIX}/lib/pcsc/drivers/.keep_me
	${TOUCH} ${PREFIX}/lib/pcsc/services/.keep_me
	@${SED} 's,%%PREFIX%%,${PREFIX},g' < ${FILESDIR}/pkg-message.in > \
		${WRKDIR}/pkg-message

.include <bsd.port.mk>
