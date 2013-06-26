# $MidnightBSD: mports/devel/gettext/Makefile,v 1.15 2013/06/21 02:18:37 laffer1 Exp $

PORTNAME=	gettext
PORTVERSION=	0.18.1.1
PORTREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	gettext

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU gettext package
LICENSE=	gpl3

USE_CHARSETFIX=	yes
USE_ICONV=	both
LIBTOOLFILES=	gettext-runtime/configure \
		gettext-runtime/libasprintf/configure gettext-tools/configure
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	ACLOCAL="${TRUE}" \
		AUTOCONF="${TRUE}" \
		AUTOMAKE="${TRUE}" \
		AUTOHEADER="${TRUE}" \
		MAKEINFO="makeinfo --no-split" \
		EMACS="no"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-csharp --disable-threads --disable-openmp \
		--with-included-gettext --with-included-glib \
		--with-included-libcroco --with-included-libxml \
		--without-git \
		--build=${ARCH}-portbld-freebsd9.1 \
		--host=${ARCH}-portbld-freebsd9.1
USE_LDCONFIG=	yes

MAN1=		autopoint.1 envsubst.1 gettext.1 gettextize.1 msgattrib.1 \
		msgcat.1 msgcmp.1 msgcomm.1 msgconv.1 msgen.1 msgexec.1 \
		msgfilter.1 msgfmt.1 msggrep.1 msginit.1 msgmerge.1 \
		msgunfmt.1 msguniq.1 ngettext.1 recode-sr-latin.1 xgettext.1
MAN3=		bind_textdomain_codeset.3 bindtextdomain.3 dcgettext.3 \
		dcngettext.3 dgettext.3 dngettext.3 gettext.3 ngettext.3 \
		textdomain.3
INFO=		autosprintf gettext

.ifdef USE_GETTEXT
.error	USE_GETTEXT is defined as an environment variable, or in the arguments \
	to "make".  Please unset it and restart the build.
.endif

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MDOCS}
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-nodocs
.endif

pre-extract:
.if exists(${PREFIX}/bin/kaffe)
	@${ECHO_MSG} "Gettext won't build with Kaffe's jar utility.  Doing:"
	-${MV} ${PREFIX}/bin/jar ${PREFIX}/bin/jar.backup
	@${ECHO_MSG} "Be sure to mv" ${PREFIX}/bin/jar.backup ${PREFIX}/bin/jar
	@${ECHO_MSG} "if you abandon your attempt to build gettext."
	@sleep 5
.endif

post-patch:
	@${FIND} ${WRKSRC} -name configure -print | ${XARGS} \
	    ${REINPLACE_CMD} -e 's|mkdir gmkdir|mkdir|; s|gawk|awk|'
.if ! ${PORT_OPTIONS:MDOCS}
.for dir in runtime tools
	@${REINPLACE_CMD} -e 's|^SUBDIRS = doc|SUBDIRS =|' \
		${WRKSRC}/gettext-${dir}/Makefile.in
.endfor
.endif

post-build:
.if exists(${PREFIX}/bin/kaffe)
	-${MV} ${PREFIX}/bin/jar.backup ${PREFIX}/bin/jar
	@${ECHO_MSG}
	@${ECHO_MSG} "Your" ${PREFIX}/bin/jar "has been restored."
	@sleep 5
.endif

post-install:
.for f in po-compat.el po-mode.el
	@${INSTALL_DATA} ${WRKSRC}/gettext-tools/misc/${f} \
			 ${PREFIX}/share/emacs/site-lisp
.endfor
	@${MKDIR} ${LOCALBASE}/share/locale
	@cd ${WRKSRC}/gettext-tools/doc && make install-info-am

.include <bsd.port.mk>
