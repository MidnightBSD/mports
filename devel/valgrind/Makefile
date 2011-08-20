# Ports collection makefile for:	valgrind
# Date created:				June 27, 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/devel/valgrind/Makefile,v 1.5 2011/02/02 20:17:34 laffer1 Exp $
#

PORTNAME=	valgrind
PORTVERSION=	352
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.rabson.org/
DISTNAME=	${PORTNAME}-stable-${PORTVERSION}

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	A (memory) debugging and profiling tool
LICENSE=	gpl2

ONLY_FOR_ARCHS=	i386
WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
USE_AUTOTOOLS+=	autoconf aclocal automake
CONFIGURE_ARGS+=--enable-maintainer-mode
USE_PERL5_BUILD=yes
USE_GCC=	3.4

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 600000
CONFIGURE_TARGET=-	${MACHINE_ARCH}-portbld-freebsd6.0
PLIST_SUB+=   RELENG_6=""
PLIST_SUB+=   RELENG_7="@comment "
.elif ${OSVERSION} < 3000
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd6.1
PLIST_SUB+=   RELENG_6=""
PLIST_SUB+=   RELENG_7="@comment "
.else
BROKEN=		doesn't work on current, missing symbols.
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
PLIST_SUB+=	RELENG_6="@comment "
PLIST_SUB+=	RELENG_7=""
.endif

PROCFS!=	/sbin/mount | ${GREP} '^procfs' | ${AWK} '{print $1}'

pre-everything::

.if ${PROCFS}
	@${ECHO_CMD} ""
	@${ECHO_CMD} "Check if procfs is running: YES"
.else
#
# /proc is not mounted on the machine in the package building cluster that
# that builds the list of IGNOREd ports (but it is on the build machines),
# so we need to make an exception here.
#
.ifndef (PACKAGE_BUILDING)
ECHO_MSG=/usr/bin/printf
IGNORE=	needs a running procfs, which is not\n\
\ \ \ \ \ activated on your system. Please read the procfs\(5\)\n\
\ \ \ \ \ man page and add the following line to /etc/fstab:\n\
\n\
\ \ \ \ \ proc /proc procfs rw 0 0\n\
\n\n
.endif
.endif

pre-patch:
.ifdef(NOPORTDOCS)
	${FIND} ${WRKSRC} -name "Makefile.in" -exec \
		${REINPLACE_CMD} -e "s/docs//g" {} \;
.endif

post-install:
	@${INSTALL_DATA} ${WRKSRC}/coregrind/vg_unistd.h \
		${PREFIX}/include/valgrind

.ifndef (PACKAGE_BUILDING)
	@yes | ${PREFIX}/bin/valgrind --tool=memcheck --gen-suppressions=yes true 2>&1 \
		| ${SED} -e 's,.*{$$,{,'  \
		| ${GREP} -v '^=' \
		> ${WRKDIR}/freebsd-default.supp || \
		${RM} ${WRKDIR}/freebsd-default.supp
.endif

.if exists(${WRKDIR}/freebsd-default.supp)
	@${INSTALL_DATA} ${WRKDIR}/freebsd-default.supp \
		${PREFIX}/lib/valgrind
PLIST_SUB+=	VALGRIND_SUPPFILE=""
.else
PLIST_SUB+=	VALGRIND_SUPPFILE="@comment "
.endif

.include <bsd.port.post.mk>
