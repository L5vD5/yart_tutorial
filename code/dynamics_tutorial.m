ccc
%% CCC
ccc
%% Make figure and change title
for tick = 1:100 % loop
    fig_idx = 1;
    fig = set_fig(figure(fig_idx),'pos',[0.5,0.5,0.3,0.45],...
        'view_info',[80,26],'axis_info',[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
        'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
        'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
    % Plot title
    title_str = sprintf('[%d] Figure $f(x) = \\exp(x)$',tick);
    plot_title(title_str,'fig_idx',fig_idx,...
        'tfs',35,'tfc','k','interpreter','latex');
    fprintf('%d\n',tick);
    drawnow; 
    if ~ishandle(fig), break; end
end % for tick = 1:100 % loop
%% Plot coordinates (3x3 rotation)
ccc;

T_world = pr2t(cv([0,0,0]),rpy2r([0,0,0])); % world coordinate

max_tick = 1000000;
local_p = [0, 0, 1];
w = [1,0,0];
for tick = 1:max_tick % loop
    % Run
    v_local = cross(w,local_p);
    local_p = local_p + v_local * 0.01;
    
    T_local = pr2t(cv(local_p),rpy2r([0,0,0]));
       
    % Animate
    if mod(tick,5) == 0 % plot every 5 tick
        fig = set_fig(figure(1),'pos',[0.5,0.5,0.3,0.45],...
            'view_info',[80,26],'axis_info',5*[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
            'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
            'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
        % Plot world coordinate
        plot_T(T_world,'fig_idx',1,'subfig_idx',1,...
            'PLOT_AXIS',1,'all',1.0,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','m','sfa',0.5,...
            'text_str','$~~\Sigma_W$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot local coordinate
        plot_T(T_local,'fig_idx',1,'subfig_idx',2,...
            'PLOT_AXIS',1,'all',0.3,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','c','sfa',0.5,...
            'text_str','$~~\Sigma_l$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot cube
        xyz_min = cv([0,0,0]);
        xyz_len = cv([0.5,0.5,0.5]);
        plot_cube(T_local,xyz_min,xyz_len,'fig_idx',1,'subfig_idx',1,...
            'bfc','b','bfa',0.3,'bec','k');
        % Plot a line from world coordinate to local coordinate
        p_world = t2p(T_world);
        p_local = t2p(T_local);
%         p_a = t2p(T_A);
        plot_line(p_world,p_local,'fig_idx',1,'lc','k','lw',1);
        % Plot title
        title_str = sprintf('[%d/%d]',tick,max_tick);
        plot_title(title_str,'fig_idx',1,'tfs',25,'tfc','k','interpreter','latex');
        drawnow;
        if ~ishandle(fig), break; end
    end
end % for tick = 1:100 % loop

%% Plot coordinates (3x3 translation)
ccc;

T_world = pr2t(cv([0,0,0]),rpy2r([0,0,0])); % world coordinate

max_tick = 1000000;
local_p = [0, 0, 1];
v = [0,1,0];
for tick = 1:max_tick % loop
    % Run
    v_local = v;
    local_p = local_p + v_local * 0.01;
    
    T_local = pr2t(cv(local_p),rpy2r([0,0,0]));
       
    % Animate
    if mod(tick,5) == 0 % plot every 5 tick
        fig = set_fig(figure(1),'pos',[0.5,0.5,0.3,0.45],...
            'view_info',[80,26],'axis_info',5*[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
            'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
            'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
        % Plot world coordinate
        plot_T(T_world,'fig_idx',1,'subfig_idx',1,...
            'PLOT_AXIS',1,'all',1.0,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','m','sfa',0.5,...
            'text_str','$~~\Sigma_W$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot local coordinate
        plot_T(T_local,'fig_idx',1,'subfig_idx',2,...
            'PLOT_AXIS',1,'all',0.3,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','c','sfa',0.5,...
            'text_str','$~~\Sigma_l$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot cube
        xyz_min = cv([0,0,0]);
        xyz_len = cv([0.5,0.5,0.5]);
        plot_cube(T_local,xyz_min,xyz_len,'fig_idx',1,'subfig_idx',1,...
            'bfc','b','bfa',0.3,'bec','k');
        % Plot a line from world coordinate to local coordinate
        p_world = t2p(T_world);
        p_local = t2p(T_local);
%         p_a = t2p(T_A);
        plot_line(p_world,p_local,'fig_idx',1,'lc','k','lw',1);
        % Plot title
        title_str = sprintf('[%d/%d]',tick,max_tick);
        plot_title(title_str,'fig_idx',1,'tfs',25,'tfc','k','interpreter','latex');
        drawnow;
        if ~ishandle(fig), break; end
    end
end % for tick = 1:100 % loop

%% Plot coordinates (3x3 translation & rotation)
ccc;

T_world = pr2t(cv([0,0,0]),rpy2r([0,0,0])); % world coordinate

max_tick = 1000000;
local_p = [0, 0, 1];
v = [0,0.1,0];
w = [0,1,0];
for tick = 1:max_tick % loop
    % Run
    v_local = v + cross(w,local_p);
    local_p = local_p + v_local * 0.01;
    
    T_local = pr2t(cv(local_p),rpy2r([0,0,0]));
       
    % Animate
    if mod(tick,5) == 0 % plot every 5 tick
        fig = set_fig(figure(1),'pos',[0.5,0.5,0.3,0.45],...
            'view_info',[80,26],'axis_info',5*[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
            'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
            'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
        % Plot world coordinate
        plot_T(T_world,'fig_idx',1,'subfig_idx',1,...
            'PLOT_AXIS',1,'all',1.0,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','m','sfa',0.5,...
            'text_str','$~~\Sigma_W$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot local coordinate
        plot_T(T_local,'fig_idx',1,'subfig_idx',2,...
            'PLOT_AXIS',1,'all',0.3,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','c','sfa',0.5,...
            'text_str','$~~\Sigma_l$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot cube
        xyz_min = cv([0,0,0]);
        xyz_len = cv([0.5,0.5,0.5]);
        plot_cube(T_local,xyz_min,xyz_len,'fig_idx',1,'subfig_idx',1,...
            'bfc','b','bfa',0.3,'bec','k');
        % Plot a line from world coordinate to local coordinate
        p_world = t2p(T_world);
        p_local = t2p(T_local);
%         p_a = t2p(T_A);
        plot_line(p_world,p_local,'fig_idx',1,'lc','k','lw',1);
        % Plot title
        title_str = sprintf('[%d/%d]',tick,max_tick);
        plot_title(title_str,'fig_idx',1,'tfs',25,'tfc','k','interpreter','latex');
        drawnow;
        if ~ishandle(fig), break; end
    end
end % for tick = 1:100 % loop

%% Plot coordinates (3x3 translation & rotation(rodrigues))
ccc;

T_world = pr2t(cv([0,0,0]),rpy2r([0,0,0])); % world coordinate

max_tick = 1000000;
local_p = [0, 0, 1];
v = [0,0.1,0];
w = [0,1,0];

for tick = 1:max_tick % loop
    % Run
    v_local = v + cross(w,local_p);
    local_p = local_p + v_local * 0.01;
    
    rot = rodrigues(w/norm(w),tick*norm(w)*0.01);

    T_local = pr2t(cv(local_p),rot);
    
    % Animate
    if mod(tick,5) == 0 % plot every 5 tick
        fig = set_fig(figure(1),'pos',[0.5,0.5,0.3,0.45],...
            'view_info',[80,26],'axis_info',5*[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
            'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
            'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
        % Plot world coordinate
        plot_T(T_world,'fig_idx',1,'subfig_idx',1,...
            'PLOT_AXIS',1,'all',1.0,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','m','sfa',0.5,...
            'text_str','$~~\Sigma_W$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot local coordinate
        plot_T(T_local,'fig_idx',1,'subfig_idx',2,...
            'PLOT_AXIS',1,'all',0.3,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','c','sfa',0.5,...
            'text_str','$~~\Sigma_l$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot cube
        xyz_min = cv([0,0,0]);
        xyz_len = cv([0.5,0.5,0.5]);
        plot_cube(T_local,xyz_min,xyz_len,'fig_idx',1,'subfig_idx',1,...
            'bfc','b','bfa',0.3,'bec','k');
        % Plot a line from world coordinate to local coordinate
        p_world = t2p(T_world);
        p_local = t2p(T_local);
%         p_a = t2p(T_A);
        plot_line(p_world,p_local,'fig_idx',1,'lc','k','lw',1);
        % Plot title
        title_str = sprintf('[%d/%d]',tick,max_tick);
        plot_title(title_str,'fig_idx',1,'tfs',25,'tfc','k','interpreter','latex');
        drawnow;
        if ~ishandle(fig), break; end
    end
end % for tick = 1:100 % loop


%% Plot coordinates (spatial vector)
ccc;

T_world = pr2t(cv([0,0,0]),rpy2r([0,0,0])); % world coordinate

max_tick = 1000000;
local_p = [0, 0, 1];
v = [0,0.1,0];
w = [0,1,0];
sv = [w, v];
sv_ = [0, 0, 0.1, 0, 0, 0];

scross = @(r) [0 -r(3) r(2); r(3) 0 -r(1); -r(2) r(1) 0;];

for tick = 1:max_tick % loop
    % Run
    sv = sv + ([scross(sv_(1:3)) zeros(3,3); scross(sv_(4:6)) scross(sv_(1:3))] * sv' * 0.01)';
    v_local = sv(4:6) + cross(sv(1:3),local_p);
    local_p = local_p + v_local*0.01;
    
    rot = rodrigues(sv(1:3)/norm(sv(1:3)),tick*norm(sv(1:3))*0.01);

    T_local = pr2t(cv(local_p),rot);
    
    % Animate
    if mod(tick,5) == 0 % plot every 5 tick
        fig = set_fig(figure(1),'pos',[0.5,0.5,0.3,0.45],...
            'view_info',[80,26],'axis_info',5*[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
            'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
            'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
        % Plot world coordinate
        plot_T(T_world,'fig_idx',1,'subfig_idx',1,...
            'PLOT_AXIS',1,'all',1.0,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','m','sfa',0.5,...
            'text_str','$~~\Sigma_W$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot local coordinate
        plot_T(T_local,'fig_idx',1,'subfig_idx',2,...
            'PLOT_AXIS',1,'all',0.3,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','c','sfa',0.5,...
            'text_str','$~~\Sigma_l$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        
        % Plot cube
        xyz_min = cv([0,0,0]);
        xyz_len = cv([0.5,0.5,0.5]);
        plot_cube(T_local,xyz_min,xyz_len,'fig_idx',1,'subfig_idx',1,...
            'bfc','b','bfa',0.3,'bec','k');
        % Plot a line from world coordinate to local coordinate
        p_world = t2p(T_world);
        p_local = t2p(T_local);
%         p_a = t2p(T_A);
        plot_line(p_world,p_local,'fig_idx',1,'lc','k','lw',1);
        % Plot title
        title_str = sprintf('[%d/%d]',tick,max_tick);
        plot_title(title_str,'fig_idx',1,'tfs',25,'tfc','k','interpreter','latex');
        drawnow;
        if ~ishandle(fig), break; end
    end
end % for tick = 1:100 % loop
