PORTNAME=	perl
PORTVERSION=	5.28.2
CATEGORIES=	lang devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../src
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	perl

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Practical Extraction and Report Language

LICENSE=	artistic gpl
LICENSE_COMB=	dual

PERL_VERSION=	${PORTVERSION}
PERL_VER=	${PORTVERSION} 

PERL_NO_DEPENDS=	yes

USES=			perl5 tar:xz
HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	Configure
CONFIGURE_ARGS=	-sde -Dprefix=${PREFIX} \
	-Darchlib=${PREFIX}/lib/perl5/${PERL_VER}/${PERL_ARCH} \
	-Dprivlib=${PREFIX}/lib/perl5/${PERL_VER} \
	-Dman3dir=${PREFIX}/lib/perl5/${PERL_VER}/perl/man/man3 \
	-Dman1dir=${PREFIX}/man/man1 \
	-Dsitearch=${PREFIX}/${SITE_PERL_REL}/${PERL_ARCH} \
	-Dsitelib=${PREFIX}/${SITE_PERL_REL} -Dscriptdir=${PREFIX}/bin \
	-Dsiteman3dir=${PREFIX}/lib/perl5/${PERL_VER}/man/man3 \
	-Dsiteman1dir=${PREFIX}/man/man1 \
	-Ui_malloc -Ui_iconv -Uinstallusrbinperl \
	-Dcc="${CC}" -Duseshrplib 


OPTIONS = DEBUGGING "Enable debugging support" Off \
	  GDBM "Build GDBM_File extension" Off \
	  PERL_MALLOC "Use Perl's malloc" On \
	  PERL_64BITINT "Use 64 bit integers" On \
	  THREADS "Enable thread support" Off \
	  SUIDPERL "Also build set-user-id suidperl binary" Off


USE_LDCONFIG=	yes
SUB_FILES=	pkg-glue perl-after-upgrade
SUB_LIST=	MAKE_CONF=${__MAKE_CONF}

PKGINSTALL=${WRKDIR}/pkg-glue
PKGDEINSTALL=${WRKDIR}/pkg-glue

MAN3PREFIX=	${PREFIX}/lib/perl5/${PERL_VER}/perl

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUGGING)
CONFIGURE_ARGS+=	-Doptimize="-g" -DDEBUGGING
STRIP=
STRIP_CMD=	${TRUE}
.else
CONFIGURE_ARGS+=	-Doptimize="${CFLAGS}"
.endif

.if defined(WITH_SUIDPERL)
CONFIGURE_ARGS+=	-Dd_dosuid=define
PLIST_SUB+=		ENABLE_SUIDPERL=""
.else
CONFIGURE_ARGS+=	-Ud_dosuid
PLIST_SUB+=		ENABLE_SUIDPERL="@comment "
.endif

.if defined(WITH_GDBM)
CONFIGURE_ARGS+=	-Di_gdbm
LIB_DEPENDS+=		gdbm.4:${PORTSDIR}/databases/gdbm
PLIST_SUB+=		GDBM=""
MAN3+=	GDBM_File.3
.else
CONFIGURE_ARGS+=	-Ui_gdbm
PLIST_SUB+=		GDBM="@comment "
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	-Dusethreads=y
PKGNAMESUFFIX=		-threaded
WITH_PTHREAD=		yes
# it seems perl malloc has problems with threaded perl 
.undef WITH_PERL_MALLOC
.else
CONFIGURE_ARGS+=	-Dusethreads=n
.endif

.if defined(WITH_PERL_MALLOC)
CONFIGURE_ARGS+=	-Dusemymalloc=y
.else
CONFIGURE_ARGS+=	-Dusemymalloc=n
.endif

.if !defined(WITHOUT_PERL_64BITINT)
CONFIGURE_ARGS+=	-Duse64bitint
.endif


post-install:
	${MKDIR} ${PREFIX}/share/licenses/perl-${PKGVERSION}
	cd ${PREFIX}/share/licenses && ${LN} -sf perl-${PKGVERSION} perl-threaded-${PKGVERSION}
	@${STRIP_CMD} ${PREFIX}/bin/perl${PERL_VER}
	@${STRIP_CMD} ${PREFIX}/bin/perl
	@${SETENV} LD_LIBRARY_PATH=${WRKSRC} ${PREFIX}/bin/perl -I${WRKSRC}/lib \
		${PREFIX}/bin/pod2man ${WRKDIR}/perl-after-upgrade >${WRKDIR}/perl-after-upgrade.1
	@${INSTALL_SCRIPT} ${WRKDIR}/perl-after-upgrade ${PREFIX}/bin/perl-after-upgrade
	@${INSTALL_MAN} ${WRKDIR}/perl-after-upgrade.1 ${MAN1PREFIX}/man/man1/perl-after-upgrade.1
	@${LN} -sf ${PREFIX}/lib/perl5/${PERL_VER}/mach/CORE/libperl.so ${PREFIX}/lib/libperl.so
	@${LN} -sf ${PREFIX}/bin/perl${PERL_VER} ${PREFIX}/bin/perl5


.include <bsd.port.post.mk>
