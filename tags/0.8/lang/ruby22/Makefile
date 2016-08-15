 $MidnightBSD$

PORTNAME=	ruby
PORTVERSION=	${RUBY_PORTVERSION}
PORTREVISION=	${RUBY_PORTREVISION}
PORTEPOCH=	${RUBY_PORTEPOCH}
CATEGORIES=	lang ruby ipv6
MASTER_SITES=	RUBY/${MASTER_SITE_SUBDIR_RUBY}
DISTNAME=	${RUBY_DISTNAME}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Object-oriented interpreted scripting language

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual

# Using LIB_DEPENDS finds the libffi from gcc which causes problems
LIB_DEPENDS=	libyaml.so:${PORTSDIR}/textproc/libyaml
BUILD_DEPENDS=	libffi>=0:${PORTSDIR}/devel/libffi
RUN_DEPENDS=	libffi>=0:${PORTSDIR}/devel/libffi

WRKSRC=		${RUBY_WRKSRC}
CONFIGURE_ARGS=	${RUBY_CONFIGURE_ARGS} \
		--disable-rpath \
		--enable-pthread \
		--enable-shared \
		--with-ruby-version=minor \
		--with-sitedir="${TRUE_PREFIX}/lib/ruby/site_ruby" \
		--with-vendordir="${TRUE_PREFIX}/lib/ruby/vendor_ruby" \
		--with-rubyhdrdir="${TRUE_PREFIX}/include/ruby-2.2/" \
		--with-rubylibprefix="${TRUE_PREFIX}/lib/ruby" \
		--docdir="${FAKE_DESTDIR}${TRUE_PREFIX}/share/doc/ruby22" \
		--mandir="${FAKE_DESTDIR}/usr/local/man" \
		--prefix=${TRUE_PREFIX} \
		--with-destdir=${FAKE_DESTDIR}
CONFIGURE_ENV+=	LC_ALL=C debugflags=
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
# Keep this, else ruby will fail to load libraries dependent of libpthread.
LIBS+=		-lpthread -L${LOCALBASE}/lib
USE_OPENSSL=	yes
USE_LDCONFIG=	yes

MAKE_ENV+=	LC_ALL=C

WRKSRC=		${WRKDIR}/${PORTNAME}-${RUBY_DISTVERSION}

RUBY_VER=		2.2
USE_RUBY=		yes
RUBY_NO_BUILD_DEPENDS=	yes
RUBY_NO_RUN_DEPENDS=	yes

OPTIONS_DEFINE=		CAPIDOCS DEBUG DOCS EXAMPLES RDOC
OPTIONS_DEFAULT=	RDOC LIBEDIT
OPTIONS_SINGLE=		EDIT
OPTIONS_SINGLE_EDIT=	LIBEDIT READLINE
OPTIONS_SUB=		yes
CAPIDOCS_DESC=		Build and install C API documents
RDOC_DESC=		Build and install Rdoc indexes
EDIT_DESC=		Which line editing lib to use
CAPIDOCS_BUILD_DEPENDS=	doxygen>0:${PORTSDIR}/devel/doxygen \
			dot:${PORTSDIR}/graphics/graphviz
CAPIDOCS_CONFIGURE_ENABLE=	install-capi
RDOC_CONFIGURE_ENABLE=	install-rdoc

USES=		execinfo cpe tar:xz autoreconf

CPE_VENDOR=	ruby-lang
CPE_VERSION=	${RUBY_RELVERSION}
CPE_UPDATE=	p${RUBY_PATCHLEVEL}

.include <bsd.port.pre.mk>

# PORTEPOCH/PORTREVISION hack

.if ${PORTEPOCH} != 0
_SUF2=	,${PORTEPOCH}
.endif

.if ${PORTREVISION} != 0
_SUF1=	_${PORTREVISION}
.endif

CONFIGURE_ARGS+=	--disable-dtrace

CONFIGURE_ENV=	debugflags=

MAKE_JOBS_UNSAFE=	yes

BUILD_DEPENDS+=	readline>=0:${PORTSDIR}/devel/readline
RUN_DEPENDS+=	readline>=0:${PORTSDIR}/devel/readline
CONFIGURE_ARGS+=	--disable-libedit --with-readline-prefix=${LOCALBASE}

.if ${RUBY_VER} == ${RUBY_DEFAULT_VER}
MLINKS=		${RUBY_NAME}.1 ruby.1
PLIST_SUB+=	IF_DEFAULT=""
.else
PKGNAMESUFFIX=	${RUBY_VER:C/\.//}
PLIST_SUB+=	IF_DEFAULT="@comment "
.endif

INSTALLED_SCRIPTS=	irb erb rdoc ri ruby

EXTSAMPLES=	bigdecimal/sample/*.rb

EXTDOCS=	readline/README*		\
		ripper/README			\
		stringio/README			\
		syslog/syslog.txt

# Macros to change variables in rbconfig.rb
RB_SET_CONF_VAR=${SH} -c '${REINPLACE_CMD} -E -e "s,(CONFIG\[\"$$0\"\][[:space:]]*=[[:space:]]*)(\(?)(.*)(\)?),\1\2$$1\4," ${WRKSRC}/rbconfig.rb' --

post-patch:
	${MKDIR} -p ${FAKE_DESTDIR}/usr
	${LN} -s ${PORTSDIR} ${FAKE_DESTDIR}${PORTSDIR}
	@${REINPLACE_CMD} -E \
		-e 's,-l$$pthread_lib,-lpthread,g' \
		-e '/^RUBY_LIB_PATH/s,\.\$$\{TEENY\},,' \
		-e '/^RUBY_SITE_LIB_PATH2/s,\.\$$\{TEENY\},,' \
		-e '/^RUBY_VENDOR_LIB_PATH2/s,\.\$$\{TEENY\},,' \
		${WRKSRC}/configure

	#
	# Eliminate all leftovers
	#
	@${FIND} ${WRKSRC}/ -name "*.orig" -delete

#
# Remove modules we don't want
#
.for d in win32ole
	${RM} -rf ${BUILD_WRKSRC}/ext/${d}
.endfor
# We get rake from ports.
.for d in bin/rake doc/rake lib/rake test/rake man/rake.1 lib/rake.rb
	${RM} -rf ${BUILD_WRKSRC}/${d}
.endfor
# We get the gem executable from ports.
	${RM} ${BUILD_WRKSRC}/bin/gem

#
# Prepare modules we are wanting to build via external ports
#
.for d in gdbm tk
	${MV} ${BUILD_WRKSRC}/ext/${d} ${WRKDIR}/
.endfor

post-build:
#
# Hack to allow modules to be installed into separate PREFIX and/or under user
# privilegies
#
	@${RB_SET_CONF_VAR} "prefix" "ENV['PREFIX'] || \3"
	@${RB_SET_CONF_VAR} "INSTALL" "'/usr/bin/install -c'"
	@${RB_SET_CONF_VAR} "INSTALL_PROGRAM" "ENV['RB_USER_INSTALL'] ? '${INSTALL} ${COPY} ${STRIP} -m ${BINMODE}' : '${INSTALL_PROGRAM}'"
	@${RB_SET_CONF_VAR} "INSTALL_SCRIPT" "ENV['RB_USER_INSTALL'] ? '${INSTALL} ${COPY} -m ${BINMODE}' : '${INSTALL_SCRIPT}'"
	@${RB_SET_CONF_VAR} "INSTALL_DATA" "ENV['RB_USER_INSTALL'] ? '${INSTALL} ${COPY} -m ${SHAREMODE}' : '${INSTALL_DATA}'"
.if ${PORT_OPTIONS:MCAPIDOCS}
	${FIND} ${WRKSRC}/doc -type d -empty -delete
.endif

pre-install:
	${MKDIR} ${RUBY_SITEARCHLIBDIR}
	${MKDIR} ${RUBY_VENDORARCHLIBDIR}
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${RUBY_DOCDIR}
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	${MKDIR} ${RUBY_EXAMPLESDIR}
.endif
.if ${PORT_OPTIONS:MRDOC}
	${MKDIR} ${RUBY_RIDIR}
	${MKDIR} ${RUBY_SITERIDIR}
.endif

post-install:
#
# Link just installed "ruby" to "ruby22", etc.
#
.if ${RUBY_VER} == ${RUBY_DEFAULT_VER}
. for FILE in ${INSTALLED_SCRIPTS}
	cd ${FAKE_DESTDIR}${TRUE_PREFIX}/bin && ${LN} -fs ${FILE}${RUBY_SUFFIX} ${FILE}
. endfor
.endif

	# Create all dirs required (":u" isn't avaiable in STABLE yet :-()
	${MKDIR} ${EXTSAMPLES:C,^([^/]+)/.*,\1,:S,^,${FAKE_DESTDIR}${RUBY_EXAMPLESDIR}/,}
	${MKDIR} ${EXTDOCS:C,^([^/]+)/.*,\1,:S,^,${FAKE_DESTDIR}${RUBY_DOCDIR}/,}
.for FILE in ${EXTSAMPLES}
	${INSTALL_DATA} ${WRKSRC}/ext/${FILE} \
		${FAKE_DESTDIR}${RUBY_EXAMPLESDIR}/${FILE:C,^([^/]+)/.*,\1,}/
.endfor
.for FILE in ${EXTDOCS}
	${INSTALL_DATA} ${WRKSRC}/ext/${FILE} \
		${FAKE_DESTDIR}${RUBY_DOCDIR}/${FILE:C,^([^/]+)/.*,\1,}/
.endfor
	@(cd ${WRKSRC}/sample/ && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${RUBY_EXAMPLESDIR}/)
	@(cd ${WRKSRC}/doc/ && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${RUBY_DOCDIR}/)
	${INSTALL_DATA} ${WRKSRC}/COPYING*	\
			${WRKSRC}/ChangeLog	\
			${WRKSRC}/LEGAL		\
			${WRKSRC}/README*	\
			${FAKE_DESTDIR}${RUBY_DOCDIR}/

	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/bin/erb22 ${PREFIX}/bin/irb22 \
		${PREFIX}/bin/rdoc22 ${PREFIX}/bin/ri22 \
		${PREFIX}/lib/ruby/2.2/amd64-midnightbsd0/rbconfig.rb  \
		${PREFIX}/libdata/pkgconfig/ruby-2.2.pc

regression-test test:
	@(cd ${WRKSRC}; ${MAKE} test)

validate:
	@${MKDIR} ${WRKSRC}/rubyspec
	rm -rf ${WRKSRC}/rubyspec/*
	(cd ${WRKSRC}/rubyspec && git clone git://github.com/rubyspec/rubyspec.git)
	(cd ${WRKSRC}/rubyspec && git clone git://github.com/rubyspec/mspec.git)
	(cd ${WRKSRC}/rubyspec/rubyspec && env PATH=${WRKSRC}/rubyspec/mspec/bin:${PATH} mspec -t ${PREFIX}/bin/ruby${RUBY_SUFFIX} .)

.include <bsd.port.post.mk>
