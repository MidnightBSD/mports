PORTNAME=	cde
DISTVERSION=	2.5.3
CATEGORIES=	x11
MASTER_SITES=	SF/cdesktopenv/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common Desktop Environment
WWW=		https://sourceforge.net/p/cdesktopenv/wiki/Home/

LICENSE=	lgpl2.1

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf \
		mkfontscale>=0:x11-fonts/mkfontscale \
		${LOCALBASE}/libdata/pkgconfig/fontconfig.pc:x11-fonts/fontconfig \
		${LOCALBASE}/libdata/pkgconfig/freetype2.pc:print/freetype2 \
		onsgmls:textproc/opensp \
		xrdb:x11/xrdb \
		sessreg:x11/sessreg
RUN_DEPENDS=	${LOCALBASE}/bin/fc-cache:x11-fonts/fontconfig \
		${LOCALBASE}/libdata/pkgconfig/freetype2.pc:print/freetype2 \
		xrdb:x11/xrdb \
		xset:x11/xset \
		sessreg:x11/sessreg
LIB_DEPENDS=	liblmdb.so:databases/lmdb

USES=		autoreconf:build iconv gmake jpeg libtool motif perl5 \
		shebangfix tcl:86 xorg
SHEBANG_LANG=	pl
SHEBANG_FILES=	programs/dtinfo/tools/bin/ccdate \
		programs/dtdocbook/tcl/docbook.tcl
DT_PREFIX=	${PREFIX}/dt
USE_LDCONFIG=	${DT_PREFIX}/lib
USE_RC_SUBR=	dtcms dtlogin
USE_XORG=	ice sm x11 xau xdmcp xext xinerama xmu xscrnsaver xt

GNU_CONFIGURE=	yes
GNU_CONFIGURE_PREFIX=	${DT_PREFIX}
GNU_CONFIGURE_MANPREFIX=	${DT_PREFIX}/share
MANDIRS=	${DT_PREFIX}/share/man
INFODIR=	${DT_PREFIX}/share/info
CONFIGURE_ARGS=	--with-tcl=${LOCALBASE}/lib/tcl8.6 MAKE="gmake" \
		--enable-german \
		--enable-italian \
		--enable-french \
		--enable-spanish \
		--enable-japanese
MAKE_ARGS+=	PERL=${PERL} "LOCAL_LDFLAGS=${LDFLAGS}"
MAKE_JOBS_UNSAFE=yes
MAKE_ENV=	MALLOC_CONF=junk:false
SUB_FILES=	pkg-message
# MidnightBSD is CSRG-based; this suppresses conflicting declarations for
# bcopy/bcmp/bzero (sbstdinc.h) and ioctl (mp_desktop.C) guarded by
# !defined(CSRG_BASED)
CFLAGS+=	-Wno-register -Wno-incompatible-function-pointer-types \
		-Wno-implicit-function-declaration -DCSRG_BASED
CXXFLAGS+=	-DCSRG_BASED
LDFLAGS+=	-z muldefs
LDFLAGS+=	-L${LOCALBASE}/lib -lutil -lX11 -lXt

CFFILES=	Xaccess Xconfig Xfailsafe Xreset Xservers Xsetup Xstartup \
		sys.dtprofile

pre-configure:
	@cd ${WRKSRC} && ./autogen.sh

post-patch:
	@if [ -f /usr/include/iconv.h ]; then \
	    ${REINPLACE_CMD} -e 's!^[[:space:]]*const char .ip = (const char .) .bp!char *ip = *bp!' \
	    ${WRKSRC}/programs/dtmail/libDtMail/Common/Session.C \
	    ${WRKSRC}/programs/dtmail/libDtMail/RFC/RFCBodyPart.C; \
	fi

# From shells/ksh93
	@${REINPLACE_CMD} -e 's|SF_FLAGS|SFIO_FLAGS|g' \
		${WRKSRC}/programs/dtksh/ksh93/src/lib/libast/include/sfio*.h  \
		${WRKSRC}/programs/dtksh/ksh93/src/lib/libast/sfio/*.c \
		${WRKSRC}/programs/dtksh/ksh93/src/lib/libast/sfio/*.h

# Needed for armv6
	@${REINPLACE_CMD} -e 's|__va_copy|va_copy|g' \
		${WRKSRC}/programs/dtksh/ksh93/src/lib/libast/hash/*.c \
		${WRKSRC}/programs/dtksh/ksh93/src/lib/libast/sfio/*.c \
		${WRKSRC}/programs/dtksh/ksh93/src/lib/libast/string/*.c

# Fix all hardcoded paths
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${LOCALBASE}/bin/perl|g' \
		${WRKSRC}/programs/dtinfo/tools/bin/ccdate
	@${FIND} ${WRKSRC} -type f ! -path doc/common | \
		${XARGS} ${REINPLACE_CMD} -e \
		's|/usr/dt|${DT_PREFIX}|g ; \
		s|/etc/dt|${DT_PREFIX}/etc|g'

# Remove a few LOCALBASE path substitutions that should stay absolute
	@${REINPLACE_CMD} -e 's|${LOCALBASE}/etc/dtsr|/etc/dtsr|g' -e \
		's|${LOCALBASE}/etc/dtinfo_start|/etc/dtinfo_start|g' \
		${WRKSRC}/programs/tttypes/dtinfo_start.ptype \
		${WRKSRC}/programs/tttypes/dtinfo.ptype

# Remove exit redefinition
	@${REINPLACE_CMD} -e '/void exit/d' \
		${WRKSRC}/lib/tt/bin/tt_type_comp/frozen.mp_types_lex.C

# Fix (time_t*) NULL for C++
	@${REINPLACE_CMD} -e 's,(time_t) *NULL,nullptr,' \
		${WRKSRC}/programs/dtmail/libDtMail/Common/FileShare.C \
		${WRKSRC}/programs/dtmail/libDtMail/RFC/RFCMailBox.C

# chown not supported during staged install
	@${FIND} ${WRKSRC} -type f -name Makefile.am | ${XARGS} \
	${REINPLACE_CMD} -e '/chown /d; /chgrp /d;'

post-install:
	@${INSTALL_DATA} ${WRKSRC}/lib/pam/libpam/pam.conf \
		${PREFIX}/etc/pam.d/cde.conf
	@${ECHO_CMD} MANPATH /usr/local/dt/share/man > \
		${PREFIX}/etc/man.d/cde.conf
	@${FIND} ${DT_PREFIX} -type f \
		-exec ${SH} -c '${STRIP_CMD} "$$0" > /dev/null 2>&1' {} \;
	@${RM} -f ${DT_PREFIX}/man
	@cd ${DT_PREFIX}; ${LN} -s share/man man
	@cd ${WRKSRC}/examples && ${FIND} . | ${CPIO} -pd \
		${DT_PREFIX}/share
	@${RM} -f ${DT_PREFIX}/examples
	@cd ${DT_PREFIX}; ${LN} -s share examples
	@${FIND} ${DT_PREFIX} -type f -name '*.bak' -delete
	@${FIND} ${DT_PREFIX} -type f -name 'ecp.*' -delete
.for f in ${CFFILES}
	@if [ -f ${PREFIX}/dt/config/${f} ]; then \
		${MV} ${PREFIX}/dt/config/${f} \
			${PREFIX}/dt/config/${f}.sample; \
	fi
.endfor

.include <bsd.port.mk>
