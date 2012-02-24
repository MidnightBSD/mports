# $MidnightBSD: mports/devel/desktop-file-utils/Makefile,v 1.7 2011/05/28 07:15:39 laffer1 Exp $
# $FreeBSD: ports/devel/desktop-file-utils/Makefile,v 1.16 2006/05/04 21:40:31 edwin Exp $

PORTNAME=	desktop-file-utils
PORTVERSION=	0.18
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	http://freedesktop.org/software/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A couple of command line utilities for working with desktop entries
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-lispdir
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" EMACS="no"

MAN1=		desktop-file-install.1 desktop-file-validate.1 \
		update-desktop-database.1

PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall

PORT_MIMEDIRS=	${LOCALBASE}/share/applications

MIMEDIRS=	${PORT_MIMEDIRS}

RMDIRS=		${PORT_MIMEDIRS}

post-patch:
	@${SED} -e 's|%%MIMEDIRS%%|${MIMEDIRS}| ;\
		s|%%RMDIRS%%|${RMDIRS}| ; \
		s|%%PORT_MIMEDIRS%%|${PORT_MIMEDIRS}|' \
		< ${FILESDIR}/pkg-deinstall.in > ${PKGDEINSTALL}
	@${SED} -e 's|%%PORT_MIMEDIRS%%|${PORT_MIMEDIRS}|' \
		< ${FILESDIR}/pkg-install.in > ${PKGINSTALL}

post-install:
	${INSTALL_DATA} ${WRKSRC}/misc/desktop-entry-mode.el \
	    	${PREFIX}/share/emacs/site-lisp/desktop-entry-mode.el
.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif

.include <bsd.port.mk>
