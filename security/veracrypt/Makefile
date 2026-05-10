PORTNAME=	veracrypt
PORTVERSION=	1.26.24
CATEGORIES=	security
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME:S/v/V/:S/c/C/}%20${PORTVERSION}/Source%20Code
DISTNAME=	${PORTNAME:S/v/V/:S/c/C/}_${PORTVERSION}_Source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source disk encryption software based on Truecrypt
WWW=		https://www.veracrypt.fr/

BUILD_DEPENDS=	yasm:devel/yasm
RUN_DEPENDS=	sudo:security/sudo
LIB_DEPENDS=	libpcsclite.so:devel/pcsc-lite \
		libwx_gtk3u_adv-3.0.so:x11-toolkits/wxgtk30 \
		libwx_gtk3u_core-3.0.so:x11-toolkits/wxgtk30 \
		libwx_baseu-3.0.so:x11-toolkits/wxgtk30

LICENSE=	Apache-2.0 TrueCrypt-3.0
LICENSE_COMB=	multi
LICENSE_NAME_TrueCrypt-3.0=	TrueCrypt License 3.0
LICENSE_FILE_TrueCrypt-3.0=	${WRKSRC}/License.txt
LICENSE_PERMS_TrueCrypt-3.0=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_FILE_Apache-2.0=	${WRKSRC}/License.txt

USES=		compiler:c++11-lang cpe desktop-file-utils fuse gmake iconv pkgconfig tar:bz2
CPE_VENDOR=	idrix
USE_CXXSTD=	c++11
USE_WX=		3.0+
NO_WRKSUBDIR=	yes
BUILD_WRKSRC=	${WRKSRC}/src
ALL_TARGET=	#
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
MAKE_ENV+=	LFLAGS=-Wl,-z,notext
.endif

post-patch:
	${REINPLACE_CMD} -e 's|ifeq "$$(shell uname -s)" "FreeBSD"|ifneq (,$$(filter FreeBSD MidnightBSD,$$(shell uname -s)))|' ${WRKSRC}/src/Makefile
	${REINPLACE_CMD} -e 's|wx-config|${WX_CONFIG}|g' ${WRKSRC}/src/Makefile
	${REINPLACE_CMD} -e 's|/usr/bin|${PREFIX}/bin|g' ${WRKSRC}/src/Setup/FreeBSD/veracrypt.desktop

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/Main/veracrypt ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/src/Setup/FreeBSD/veracrypt.desktop ${PREFIX}/share/applications/
.	for RESO in 128 16 256 48
		@${MKDIR} ${PREFIX}/share/icons/hicolor/${RESO}x${RESO}/apps
		${INSTALL_DATA} ${WRKSRC}/src/Resources/Icons/VeraCrypt-${RESO}x${RESO}.xpm ${PREFIX}/share/icons/hicolor/${RESO}x${RESO}/apps/${PORTNAME}.xpm
.	endfor

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/html
	${INSTALL_DATA} ${WRKSRC}/License.txt ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc/html && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/html

.include <bsd.port.post.mk>
