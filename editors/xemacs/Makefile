# $MidnightBSD: mports/editors/xemacs/Makefile,v 1.10 2010/03/25 01:16:37 laffer1 Exp $

PORTNAME=	xemacs
PORTVERSION=	${XEMACS_VER}
PORTREVISION=	3
CATEGORIES+=	editors
MASTER_SITES=	${MASTER_SITE_XEMACS}
MASTER_SITE_SUBDIR=	xemacs-${XEMACS_REL}
DISTNAME=	xemacs-${XEMACS_VER}
DIST_SUBDIR=	xemacs

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	This port tracks the stable version of the XEmacs text editor
LICENSE=	gpl2

CONFLICTS=	emacs-19.* emacs-21.* \
		xemacs-devel-[0-9]* 

XEMACS_REL=	21.4
XEMACS_VER=	21.4.22
XEMACS_ARCH=	${CONFIGURE_TARGET}

USE_BZIP2=	yes
WANT_GNOME=	yes
STRIP=
USE_AUTOTOOLS=	autoconf:213
CONFIGURE_TARGET=${MACHINE_ARCH}--freebsd

CONFIGURE_ARGS?=--with-clash-detection \
		--with-sound=native,nonas,noesd \
		--site-includes=${LOCALBASE}/include \
		--site-libraries=${LOCALBASE}/lib \
		--with-site-lisp \
		--with-database=berkdb \
		${WITH_SCROLLBARS} ${WITH_DIALOGS} ${WITH_WIDGETS} \
		${WITH_XFACE} ${WITH_OFFIX}
MAN1=		ctags.1 etags.1 gnuattach.1 gnuclient.1 gnudoit.1 \
		gnuserv.1 xemacs.1
ALL_TARGET=	all dist

FAKE_OPTS=	prefixhack

SKIP_FAKE_CHECK=	bin/xemacs-${XEMACS_VER} 

PLIST_SUB=	XEMACS_VER=${XEMACS_VER} XEMACS_ARCH=${XEMACS_ARCH} \
		LOCALBASE=${LOCALBASE} X11BASE=${X11BASE}

.include <bsd.port.pre.mk>

FAKE_MAKEARGS+=	mandir=${FAKE_DESTDIR}${MANPREFIX}/man/man1 \
		infodir=${FAKE_DESTDIR}${PREFIX}/lib/xemacs-${XEMACS_VER}/info


# Undump and malloc do not behave on amd64 at the moment
.if ${ARCH} == amd64
CONFIGURE_ARGS+=	--with-system-malloc --pdump
PLIST_SUB+=	PDUMP=""
.else
PLIST_SUB+=	PDUMP="@comment "
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=	--with-ldap
.else
CONFIGURE_ARGS+=	--with-ldap=no
.endif

.if !defined(WITHOUT_XEMACS_PACKAGES)
RUN_DEPENDS+=	${LOCALBASE}/lib/xemacs/xemacs-packages/etc/enriched.doc:${PORTSDIR}/editors/xemacs-packages
.endif
.if !defined(WITHOUT_X11)
LIB_DEPENDS+=	png.5:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff
CONFIGURE_ARGS+=	--with-png --with-jpeg --with-tiff
USE_XORG=	xpm x11
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xbitmaps.pc:${PORTSDIR}/x11/xbitmaps

MAKE_JOBS_SAFE=  yes

#.if !defined(WITHOUT_MOTIF) && !defined(MOTIF_STATIC)
#USE_MOTIF=	yes
#WITH_SCROLLBARS=	--with-scrollbars=motif
#WITH_DIALOGS=	--with-dialogs=motif
#WITH_WIDGETS=	--with-widgets=motif
#.else
WITH_SCROLLBARS=	--with-scrollbars=athena
WITH_DIALOGS=	--with-dialogs=athena
WITH_WIDGETS=	--with-widgets=athena
.if defined(WITH_XAW3D)
LIB_DEPENDS+=	Xaw3d.${XAWVER}:${PORTSDIR}/x11-toolkits/Xaw3d
CONFIGURE_ARGS+=	--with-athena=3d
.endif
#.endif
.else
CONFIGURE_ARGS+=	--without-x11
.endif

.if !defined(WITHOUT_X11) && ${HAVE_GNOME:Mgnomehier}!=""
USE_GNOME+=	gnomehier
PLIST_SUB+=	DESKTOP=""
.else
PLIST_SUB+=	DESKTOP="@comment "
.endif

#post-extract::
#	@${SED} -e 's|@XEMACS_ICON@|${LOCALBASE}/lib/xemacs-${XEMACS_VER}/etc/xemacs-icon.xpm|' \
#		<${FILESDIR}/xemacs.desktop.in >${WRKDIR}/xemacs.desktop

pre-patch:
.if !defined(WITHOUT_X11)
.if !defined(WITHOUT_MOTIF) && !defined(MOTIF_STATIC)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "If your MOTIF library is lesstif you might occasionally"
	@${ECHO_MSG} "experience locked-up frames."
	@${ECHO_MSG} "In this case, set the environment variable WITHOUT_MOTIF"
	@${ECHO_MSG} "and recompile, which will force the use of athena for"
	@${ECHO_MSG} "scrollbars, dialogs and widgets."
.endif
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Set the environment variable WITHOUT_X11 if you do not"
	@${ECHO_MSG} "want to use X11."
.endif

# Drop faces (libcompface) and offix (libDnd) if building package,
# autodetect otherwise
.if defined(PACKAGE_BUILDING)
WITH_XFACE?=	--with-xface=no
WITH_OFFIX?=	--with-offix=no
.endif

# fix .so references in a few man pages
pre-configure::
.for f in etc/ctags.1 etc/gnuattach.1 etc/gnuclient.1 etc/gnudoit.1
	@${SED} -e 's/\.1/&.gz/' ${WRKSRC}/${f} > ${WRKDIR}/tmp_zot
	@${MV} ${WRKDIR}/tmp_zot ${WRKSRC}/${f}
.endfor

post-install::
.for f in b2m ctags ellcc etags gnuclient xemacs-${XEMACS_VER}
	${STRIP_CMD} ${PREFIX}/bin/${f}
.endfor
	
.include <bsd.port.post.mk>
