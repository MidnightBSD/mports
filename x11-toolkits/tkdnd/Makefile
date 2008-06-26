# New ports collection makefile for:	tkdnd
# Date created:		14 October 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/tkdnd/Makefile,v 1.3 2008/05/11 20:35:35 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/tkdnd/Makefile,v 1.2 2006/12/03 02:55:48 sat Exp $
#

PORTNAME=	tkdnd
PORTVERSION=	1.0
PORTREVISION=	1
DISTVERSION=	1.0.20040304
CATEGORIES=	x11-toolkits tk
MASTER_SITES=	CENKES
# Distfile prepared from SourceForge CVS

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Native drag and drop capabilities

USE_BZIP2=	yes
USE_XORG=	x11 xext
USE_TCL=	yes
USE_TCL_BUILD=	yes
USE_TK_BUILD=	yes
USE_TK=		yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-tcl=${TCL_LIBDIR} --with-tk=${TK_LIBDIR} \
		--with-tclinclude=${TCL_INCLUDEDIR} --with-tkinclude=${TK_INCLUDEDIR} --enable-shared
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0 \
			--target=${ARCH}-portbld-freebsd6.0
CPPFLAGS=	-I${TK_INCLUDEDIR}/generic -I${TCL_INCLUDEDIR}/generic
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}"
TKPKG=		${PORTNAME}${PORTVERSION}
PLIST_SUB=	TKPKG=${TKPKG}
USE_LDCONFIG=	${PREFIX}/lib/${TKPKG}
MANN=		${PORTNAME}.n

post-patch:
	@${REINPLACE_CMD} -e 's/@CFLAGS_DEFAULT@/-fPIC/' ${WRKSRC}/Makefile.in
#	@${REINPLACE_CMD} -e 's/@MAKE_LIB@/${CC} -shared -fPIC  ${TK_LIBS} ${SHLIB_LD} -o $@ $(PKG_OBJECTS) ${SHLIB_LD_FLAGS} ${SHLIB_LD_LIBS}/' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -Ee '/^install:/s#install-doc##' -e 's#.*txt.*##' ${WRKSRC}/Makefile.in

post-install:
	@${LN} -sf ${USE_LDCONFIG}/lib${TKPKG}.so ${USE_LDCONFIG}/lib${TKPKG}.so.0
	@${INSTALL_MAN} ${WRKSRC}/doc/tkDND.n ${MANNPREFIX}/man/mann/${MANN}

.include <bsd.port.mk>
